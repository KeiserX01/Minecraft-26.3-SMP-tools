# Arquitectura de PLM

## Visión general

PLM implementa un sistema de cooldown individual para cada jugador que solicita cambiar su Prank Level. La arquitectura utiliza un reloj global compartido y deadlines individuales almacenados en scoreboards.

## Componentes

### 1. Configuración (`plm:config`)

Almacena la duración del cooldown en segundos:

```snbt
{
    operation_cooldown_seconds: 18000
}
```

### 2. Conversión de segundos a ticks

Durante la inicialización (`plm:load`), el valor configurado se convierte a ticks:

```
execute store result score #cooldown plm_clock run data get storage plm:config operation_cooldown_seconds 20
```

- `plm:config` almacena segundos (ej: 18000)
- `plm_clock:#cooldown` almacena ticks (ej: 360000)

### 3. Reloj global (`#now`)

Utiliza `time query gametime` para obtener el Game Time actual del mundo. Todos los jugadores comparten este reloj.

### 4. Deadline individual (`prank_deadline`)

Cada jugador tiene su propio score en `prank_deadline`. Se calcula una sola vez al iniciar la operación:

```
deadline = now + cooldown
```

### 5. Estado de operación (`prank_operations`)

- 0 = No hay operación pendiente
- 1 = Existe una operación pendiente

### 6. Nivel de Prank (`prank_level`)

Almacena el nivel solicitado (1, 2, 3 o 4).

### 7. Dispatcher global (`plm:operation/dispatch`)

Se ejecuta cada segundo y compara el deadline de cada jugador con el reloj global:

```
execute store result score #now plm_clock run time query gametime
execute as @a[scores={prank_operations=1}] if score @s prank_deadline <= #now plm_clock run function plm:operation/complete
schedule function plm:operation/dispatch 1s replace
```

### 8. Finalización (`plm:operation/complete`)

Ejecuta la función correspondiente al nivel del jugador, aplica el suffix mediante MultiTag, y resetea el estado.

## Reglas de diseño

- No se mantienen contadores incrementales individuales
- No se utiliza un único deadline compartido
- El dispatcher no modifica deadlines
- Se utiliza un único dispatcher global con `schedule ... replace`
- Las operaciones no se cancelan al cerrar un Dialog
- No se permiten operaciones simultáneas para un mismo jugador
- Los datos se conservan durante desconexiones y recargas
- Se reutiliza MultiTag para modificar suffixes
