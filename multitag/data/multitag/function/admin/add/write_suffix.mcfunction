# Macros requeridas (vienen definidas al entrar con with storage multitag:user<macro_id>):
#   $(macro_id)  : UUID[0] del jugador (nombre del equipo)
#   $(suffix)    : sufijo ya almacenado para el jugador
#   $(new_suffix): nuevo sufijo que se suma después del existente
#
# Construye el sufijo combinado y lo persiste en storage individual.
$data modify storage multitag:user$(macro_id) suffix set value [{text:" ",extra:[$(suffix),$(new_suffix)]}]

# Escribe directamente el sufijo combinado en el team del jugador.
$team modify $(macro_id) suffix [{text:" ",extra:[$(suffix),$(new_suffix)]}]
