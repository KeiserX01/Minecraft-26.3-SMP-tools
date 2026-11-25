# Escribe directamente el suffix del jugador en su equipo.
# Macros requeridas (provenientes de storage multitag:user<macro_id>):
#   $(macro_id) : UUID[0] del jugador (nombre del equipo)
#   $(suffix)   : componente JSON del suffix
$team modify $(macro_id) suffix $(suffix)
