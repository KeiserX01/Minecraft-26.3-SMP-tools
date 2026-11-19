$data modify storage multitag:runtime suffix set value $(suffix)
data modify storage multitag:runtime prefix set from storage multitag:config default.prefix
function multitag:admin/apply_suffix with storage multitag:runtime

$data modify storage multitag:runtime target set value $(target)
$execute store result storage multitag:runtime user_id int 1 run data get entity $(target) UUID[0]
function multitag:external-storage/save-user-data with storage multitag:runtime