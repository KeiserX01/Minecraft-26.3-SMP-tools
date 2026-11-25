# Prepara y aplica el prefix de un jugador.
# Macros de entrada (desde dialog / comando): $(target), $(prefix)
# macro_id NO se declara como placeholder aqui; se calcula en runtime
# y se pasa a do_prefix mediante with storage para que llegue como macro valida.
$execute store result storage multitag:runtime macro_id int 1 run data get entity $(target) UUID[0]
$data modify storage multitag:runtime target set value $(target)
$data modify storage multitag:runtime prefix set value $(prefix)
function multitag:admin/do_prefix with storage multitag:runtime
