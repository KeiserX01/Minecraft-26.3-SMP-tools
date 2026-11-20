$data modify storage multitag:runtime prefix set value $(prefix)
$execute store result storage multitag:runtime macro_id int 1 run data get entity $(target) UUID[0]
$data modify storage multitag:runtime target set value $(target)

function multitag:external-storage/save-user-data with storage multitag:runtime
function multitag:admin/prefix_intermediate with storage multitag:runtime
