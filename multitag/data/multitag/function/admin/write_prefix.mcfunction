# Escribe directamente el prefix del jugador en su equipo.
# Macros requeridas (provenientes de storage multitag:user<macro_id>):
#   $(macro_id) : UUID[0] del jugador (nombre del equipo)
#   $(UUID)     : UUID completo del jugador
#   $(prefix)   : componente JSON del prefix
$team modify $(macro_id) prefix [{object:player,player:{id:$(UUID)}},$(prefix)]
