$data modify storage multitag:runtime prefix set value $(prefix)
$execute as @a[name="$(target)"] run function multitag:admin/apply_prefix
