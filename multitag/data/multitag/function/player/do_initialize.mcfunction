# Crea el team individual del jugador, asegura su storage y aplica prefix/suffix.
# Macros requeridas (vienen definidas al entrar con with storage multitag:runtime):
#   $(macro_id) : UUID[0] del jugador (nombre del equipo)

# Crear el team individual si no existe
$execute store success score #created multitag.tmp run team add $(macro_id)

# Unir al jugador a su equipo
$team join $(macro_id) @s

# Asegurar que existe el storage individual del jugador
$data modify storage multitag:user$(macro_id) macro_id set value $(macro_id)
$data modify storage multitag:user$(macro_id) UUID set from entity @s UUID

# Escribir defaults de config en el storage individual (valores iniciales si no hay datos previos)
$data modify storage multitag:user$(macro_id) prefix set from storage multitag:config default.prefix
$data modify storage multitag:user$(macro_id) suffix set from storage multitag:config default.suffix

# Aplicar prefix y suffix al team usando el storage individual como origen de macros
$function multitag:admin/apply_prefix with storage multitag:user$(macro_id)
$function multitag:admin/apply_suffix with storage multitag:user$(macro_id)
