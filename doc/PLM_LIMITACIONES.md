# Limitaciones Conocidas — PLM

## Tiempo de juego frente a tiempo real

PLM utiliza `time query gametime` para medir el cooldown. Consecuencias:

- Si el servidor está apagado, el Game Time no avanza
- Si el servidor funciona por debajo de 20 TPS, el cooldown tarda más tiempo real en completarse
- Cinco horas configuradas equivalen a 360000 ticks de juego, no necesariamente a cinco horas de reloj de pared

## Límite de scoreboards

Los scores de Minecraft son enteros con signo de 32 bits. El límite teórico se alcanzaría aproximadamente después de 3,4 años de tiempo de juego continuo.

## Dependencia de MultiTag

PLM requiere que MultiTag esté instalado y que exista la función `multitag:admin/set_suffix_self`. Sin esta función, las operaciones no podrán aplicar suffixes al finalizar.

## Solo jugadores conectados

El dispatcher utiliza `@a`, por lo que solo procesa jugadores conectados. Si un jugador se desconecta con una operación pendiente, esta se completará cuando vuelva a conectarse.

## Sin protección de Dialog

El cierre de un Dialog con Escape no cancela ni inicia operaciones. Solo la acción Apply ejecuta el flujo de operación.
