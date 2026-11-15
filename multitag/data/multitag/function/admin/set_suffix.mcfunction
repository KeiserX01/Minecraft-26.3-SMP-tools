$data modify storage multitag:runtime suffix set value $(suffix)
$execute as @a[name="$(target)"] run function multitag:admin/apply_suffix with entity @s
