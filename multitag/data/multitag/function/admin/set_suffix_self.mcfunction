$data modify storage multitag:runtime suffix set value $(suffix)
$data modify storage multitag:runtime target set value $(target)
$execute store result storage multitag:runtime macro_id int 1 run data get entity $(target) UUID[0]

function multitag:admin/do_suffix with storage multitag:runtime