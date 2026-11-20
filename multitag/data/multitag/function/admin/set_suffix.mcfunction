$data modify storage multitag:runtime suffix set value $(suffix)
$execute store result storage multitag:runtime user_id int 1 run data get entity $(target) UUID[0]
$data modify storage multitag:runtime target set value $(target)

$execute as @a[name="$(target)"] run function multitag:admin/apply_suffix with entity @s
function multitag:external-storage/save-user-data with storage multitag:runtime
