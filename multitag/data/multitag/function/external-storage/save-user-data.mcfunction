$data modify storage multitag:user$(user_id) UUID set from entity @p[name=$(target)] UUID
$data modify storage multitag:user$(user_id) prefix set value $(prefix)
$data modify storage multitag:user$(user_id) suffix set value $(suffix)
$data modify storage multitag:user$(user_id) nickname set value $(target)
$data modify storage multitag:user$(user_id) user_id set value $(user_id)


