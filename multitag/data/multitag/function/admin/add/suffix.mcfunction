$data modify storage multitag:runtime new_suffix set value $(new_suffix)
$data modify storage multitag:runtime user_id set from entity @p[name=$(target)] UUID[0]
$data modify storage multitag:runtime target set value $(target)

function multitag:admin/add/intermediate with storage multitag:runtime
say "add suffix funca"