# Macros requeridas (vienen definidas al entrar con with storage multitag:runtime):
#   $(macro_id) : UUID[0] del jugador
#   $(target)   : nombre del jugador
#   $(new_suffix): componente JSON del nuevo sufijo
#
# Copia new_suffix al storage individual para que llegue como macro al siguiente paso.
$data modify storage multitag:user$(macro_id) new_suffix set from storage multitag:runtime new_suffix

# Llama a write_suffix con storage individual (ahora $(suffix) y $(new_suffix) son macros válidas)
$function multitag:admin/add/write_suffix with storage multitag:user$(macro_id)
