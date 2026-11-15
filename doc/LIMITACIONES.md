# Limitaciones Conocidas — MultiTag

## Limitación principal: UUID[0] de 32 bits

El identificador del team se basa exclusivamente en `UUID[0]`, que tiene solo 32 bits. Esto significa:

- Dos jugadores con UUID completos diferentes pueden compartir el mismo `UUID[0]`
- Si dos jugadores comparten `UUID[0]`, estarán en el mismo team
- No hay validación adicional del UUID completo en la primera versión

Esto es una limitación aceptada conscientemente para mantener el sistema simple.

## Limitaciones del sistema Dialog

- **Solo jugadores conectados:** Los Dialogs resuelven jugadores mediante `@a[name="..."]`, que solo encuentra jugadores conectados. Jugadores desconectados no pueden modificarse.
- **Sin validación de inputs:** Los valores de los campos de texto no se validan automáticamente. Caracteres especiales (comillas dobles, barras invertidas) pueden romper la construcción SNBT.
- **Sin protecciones de permisos:** Los Dialogs no tienen un sistema integrado de comprobación de permisos. Cualquier jugador que pueda ejecutar `/function multitag:admin/open_tag_panel` puede acceder al panel.

## Limitaciones de diseño

- **No hay sistema de debug:** No se implementan herramientas de diagnóstico.
- **No hay sistema de migración:** No se migran datos de versiones anteriores.
- **No hay registro de propietarios:** No se mantiene una tabla persistente de nombres y UUID.
- **No hay validación del UUID completo:** Solo se usa `UUID[0]`.
- **No hay API de modificación de prefijos adicional:** Solo existen `set_prefix` y `set_suffix`.
- **No hay sistemas de etiquetas múltiples:** Cada jugador pertenece a un solo team.
- **No hay funciones de reparación automática:** No se verifica ni repara teams corruptos.
- **No hay procesamiento periódico de jugadores con team:** Solo se procesan jugadores sin team.

## Comportamiento esperado

| Escenario | Comportamiento |
|-----------|---------------|
| Jugador se une sin team | Se le asigna automáticamente un team basado en UUID[0] |
| Jugador se une con team | No se le vuelve a procesar |
| Jugador se desconecta y reconecta | Mantiene su team (no se reprocesa) |
| `/reload` | No borra teams ni configuración |
| Dos jugadores con mismo UUID[0] | Comparten el mismo team |
| Jugador sin team modificado por admin | No se modifica ningún team (jugador no encontrado) |
| Texto vacío en prefix/suffix | Se aplica texto vacío (quita el componente) |
