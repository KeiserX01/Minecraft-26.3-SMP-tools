# PLM — Prank Level Manager

Datapack vanilla para Minecraft Java Edition 26.3 que implementa un sistema de cooldown individual para cambios de Prank Level.

## Estructura del proyecto

```
plm/
├── pack.mcmeta                            # Data Pack Format 121.0
├── data/
│   ├── plm/
│   │   ├── dialog/
│   │   │   └── prank_level_dialog.json    # Dialog GUI para seleccionar nivel
│   │   ├── tags/function/
│   │   │   └── load.json
│   │   └── function/
│   │       ├── load.mcfunction            # Inicialización del sistema
│   │       └── operation/
│   │           ├── dispatch.mcfunction    # Dispatcher global (cada segundo)
│   │           ├── open_panel.mcfunction  # Abre el Dialog GUI
│   │           ├── set_level.mcfunction   # Recibe nivel vía argumento, invoca start
│   │           └── start.mcfunction       # Valida, establece nivel, calcula deadline
│   │               └── complete.mcfunction # Finalización de operación
│   │                   ├── level_1.mcfunction
│   │                   ├── level_2.mcfunction
│   │                   ├── level_3.mcfunction
│   │                   └── level_4.mcfunction
│   └── minecraft/
│       └── tags/function/
│           └── load.json
```

## Objetivos de scoreboard

| Objetivo | Tipo | Uso |
|----------|------|-----|
| `plm_clock` | dummy | Variables globales auxiliares (`#now`, `#cooldown`) |
| `prank_deadline` | dummy | Deadline individual por jugador |
| `prank_operations` | dummy | Estado de operación (0 = libre, 1 = pendiente) |
| `prank_level` | dummy | Nivel de Prank solicitado (1-4) |

## Fake players

| Fake player | Objetivo | Uso |
|-------------|----------|-----|
| `#now` | `plm_clock` | Game Time actual del mundo |
| `#cooldown` | `plm_clock` | Duración del cooldown en ticks |

## Flujo de una operación (vía GUI)

1. **Abrir panel**: `/function plm:operation/open_panel` → abre `prank_level_dialog`
2. **Seleccionar nivel**: Usuario elige 1-4 en el número_range y pulsa "Aplicar"
3. **Enviar nivel**: Dialog ejecuta `function plm:operation/set_level {prank_level:<n>}`
4. **set_level**: Guarda `prank_level` en `plm:runtime`, invoca `start` con `with storage`
5. **start (función macro)**:
   - Verifica que `prank_operations = 0` (si no, rechaza con tellraw rojo)
   - Establece `prank_level = $(prank_level)`
   - Obtiene `#now = time query gametime`
   - Calcula `deadline = #now + #cooldown`
   - Establece `prank_operations = 1`
   - Muestra tellraw de éxito (verde)
6. **Dispatcher**: Cada segundo compara `deadline <= #now` para jugadores con `prank_operations = 1`
7. **Finalizar**: Aplicar suffix mediante `multitag:admin/set_suffix_self`, resetear `prank_operations = 0`

## Correspondencia de niveles y suffixes

| Nivel | Suffix |
|-------|--------|
| 1 | ➀ |
| 2 | ➁ |
| 3 | ➂ |
| 4 | ➃ |

## Configuración

La duración del cooldown se configura en `plm:config`:

```snbt
{
    operation_cooldown_seconds: 18000
}
```

Valor inicial: 18000 segundos (5 horas = 360000 ticks).

## Uso

El datapack se inicia automáticamente al cargar (tag `load`).

El dispatcher se autorreprograma cada segundo con `schedule ... replace`.

Para iniciar una operación, un jugador debe:
1. Verificar que no tiene operación pendiente
2. Establecer su `prank_level`
3. Calcular y guardar su `prank_deadline`
4. Establecer `prank_operations = 1`

## Integración con MultiTag

PLM reutiliza la API administrativa de MultiTag para aplicar suffixes:

- `multitag:admin/set_suffix_self {suffix:{text:" ➀"}}` — Aplica suffix al jugador que ejecuta la función

Este adaptador se creó específicamente para PLM en MultiTag.

## Características

- ✅ Cooldown configurable en segundos (convertido a ticks automáticamente)
- ✅ Cada jugador tiene su propio deadline independiente
- ✅ Reloj global compartido (`time query gametime`)
- ✅ No contadores incrementales individuales
- ✅ Dispatcher global que comprueba operaciones pendientes cada segundo
- ✅ Operaciones sobreviven a desconexión de jugadores
- ✅ Se recupera tras reinicio del servidor o recarga de datapacks
- ✅ Cooldown medido en ticks de juego, no tiempo real

## Limitaciones

- El cooldown mide tiempo de juego (gametime), no tiempo real de pared
- Si el servidor está apagado, el Game Time no avanza
- Scores son enteros de 32 bits con signo (límite ~3.4 años de juego continuo)
