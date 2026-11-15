# Arquitectura del Sistema MultiTag

## Visión general

MultiTag es un datapack vanilla para Minecraft Java Edition 26.3 que asigna un scoreboard team individual a cada jugador. El nombre del team es el primer entero del UUID del jugador (`UUID[0]`).

## Componentes del sistema

### 1. Almacenamiento (Storages)

El sistema utiliza exactamente dos storages:

| Storage | Responsabilidad |
|---------|-----------------|
| `multitag:config` | Configuración predeterminada (prefix y sufijo por defecto) |
| `multitag:runtime` | Datos temporales de ejecución (team_id, prefix, suffix) |

### 2. Flujo de ejecución principal

```
tick.mcfunction
  └── execute as @a[team=] → player/initialize.mcfunction (por cada jugador sin team)
        └── initialize.mcfunction
              1. Limpiar team_id (set value 0)
              2. Obtener UUID[0] del jugador → team_id
              3. Copiar prefix/sufijo desde config a runtime
              4. Invocar macro: player/apply_team
              5. Limpiar team_id (set value 0)
        └── player/apply_team.mcfunction (macro)
              1. Ejecutar team add $(team_id) → guardar éxito en #created
              2. Si se creó (#created = 1) → player/configure_team
              3. Ejecutar team join $(team_id) @s
        └── player/configure_team.mcfunction (macro)
              1. team modify $(team_id) prefix $(prefix)
              2. team modify $(team_id) suffix $(suffix)
```

### 3. Sistema administrativo

```
admin/set_prefix.mcfunction (macro)
  └── Guardar prefix en runtime.prefix
  └── Buscar jugador por nombre: @a[name="$(target)"]
  └── Ejecutar como jugador: admin/apply_prefix
        └── Obtener UUID[0] → runtime.team_id
        └── Ejecutar: admin/write_prefix
              └── team modify $(team_id) prefix $(prefix)
  └── Limpiar team_id

admin/set_suffix.mcfunction (macro)
  └── Guardar suffix en runtime.suffix
  └── Buscar jugador por nombre: @a[name="$(target)"]
  └── Ejecutar como jugador: admin/apply_suffix
        └── Obtener UUID[0] → runtime.team_id
        └── Ejecutar: admin/write_suffix
              └── team modify $(team_id) suffix $(suffix)
  └── Limpiar team_id
```

### 4. Tag Panel (Dialogs)

Tres Dialogs independientes de tipo `minecraft:multi_action`:

| Dialog | Propósito | Tipo | Archivo |
|--------|-----------|------|---------|
| `tag_menu` | Menú principal de navegación | `multi_action` | `dialog/tag_menu.json` |
| `tag_prefix` | Editor de prefix por jugador | `multi_action` | `dialog/tag_prefix.json` |
| `tag_suffix` | Editor de suffix por jugador | `multi_action` | `dialog/tag_suffix.json` |

**Navegación:**
- Menú → botón "Prefix" → abre `tag_prefix`
- Menú → botón "Suffix" → abre `tag_suffix`
- Menú → botón "Exit" → cierra el menú
- Editores → Escape → cierra el editor (`can_close_with_escape: true`)
- Editores → "Aplicar Cambios" → ejecuta función administrativa correspondiente

### 5. Reglas de diseño

- **No hay sistema de debug**
- **No hay sistema de migración**
- **No hay registro de propietarios**
- **No hay validación del UUID completo** (solo UUID[0])
- **No hay API de modificación de prefijos adicional**
- **No hay sistemas de etiquetas múltiples**
- **No hay funciones de reparación automática**
- **No hay procesamiento periódico de jugadores que ya tienen team**
- **El storage `runtime` se limpia después de cada operación** (team_id = 0)

## Limitación conocida

`UUID[0]` tiene solo 32 bits. Dos jugadores pueden compartir ese valor aunque tengan UUID completos diferentes, lo que significa que pueden compartir el mismo team. Esta limitación está aceptada en la primera versión.
