# Prepara y aplica el suffix de un jugador.
# Macros de entrada (desde dialog / comando): $(target), $(suffix)
# macro_id NO se declara como placeholder aqui; se calcula en runtime
# y se pasa a do_suffix mediante with storage para que llegue como macro valida.
$execute store result storage multitag:runtime macro_id int 1 run data get entity $(target) UUID[0]
$data modify storage multitag:runtime target set value $(target)
$data modify storage multitag:runtime suffix set value $(suffix)
function multitag:admin/do_suffix with storage multitag:runtime
