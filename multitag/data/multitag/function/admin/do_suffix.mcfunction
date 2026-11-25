# Escribe el suffix en el storage individual del jugador y lo aplica al team.
# Macros requeridas (vienen definidas al entrar con with storage multitag:runtime):
#   $(macro_id) : UUID[0] del jugador
#   $(target)   : nombre del jugador
#   $(suffix)   : componente JSON del suffix
$data modify storage multitag:user$(macro_id) macro_id set value $(macro_id)
$data modify storage multitag:user$(macro_id) UUID set from entity $(target) UUID
$data modify storage multitag:user$(macro_id) nickname set value $(target)
$data modify storage multitag:user$(macro_id) suffix set value $(suffix)

# Aplicar al team usando el storage individual como origen de macros
$function multitag:admin/apply_suffix with storage multitag:user$(macro_id)
