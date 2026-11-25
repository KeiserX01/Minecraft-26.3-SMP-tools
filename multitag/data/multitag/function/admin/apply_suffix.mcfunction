# Aplica el suffix guardado en storage individual al equipo del jugador.
# Macros requeridas (desde storage multitag:user<macro_id>):
#   $(macro_id), $(suffix)
$function multitag:admin/write_suffix with storage multitag:user$(macro_id)
