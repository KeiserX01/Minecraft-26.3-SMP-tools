$data modify storage multitag:runtime prefix set value $(prefix)
$execute as @a[name="$(target)"] run function multitag:admin/apply_prefix

$data modify storage multitag:runtime target set value $(target)
$execute store result storage multitag:runtime user_id int 1 run data get entity $(target) UUID[0]
function multitag:external-storage/save-user-data with storage multitag:runtime