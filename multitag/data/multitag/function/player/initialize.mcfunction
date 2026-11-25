# Restaura o inicializa prefix y suffix de un jugador al cargar/unirse.
# macro_id se calcula en runtime y se pasa a do_initialize mediante with storage
# para que llegue como macro valida.
execute store result storage multitag:runtime macro_id int 1 run data get entity @s UUID[0]
function multitag:player/do_initialize with storage multitag:runtime
data modify storage multitag:runtime macro_id set value 0
