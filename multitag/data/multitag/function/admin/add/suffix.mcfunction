# Punto de entrada para añadir suffix (desde dialog tag_add_suffix).
# Macros de entrada: $(target), $(new_suffix)
# Calcula macro_id y lo pasa a intermediate mediante with storage.
$execute store result storage multitag:runtime macro_id int 1 run data get entity $(target) UUID[0]
$data modify storage multitag:runtime target set value $(target)
$data modify storage multitag:runtime new_suffix set value $(new_suffix)
function multitag:admin/add/intermediate with storage multitag:runtime
