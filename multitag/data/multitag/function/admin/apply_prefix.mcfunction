# Aplica el prefix guardado en storage individual al equipo del jugador.
# Macros requeridas (desde storage multitag:user<macro_id>):
#   $(macro_id), $(UUID), $(prefix)
$function multitag:admin/write_prefix with storage multitag:user$(macro_id)
