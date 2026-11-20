$data modify storage multitag:user$(macro_id) UUID set from entity @p[name=$(target)] UUID
$data modify storage multitag:user$(macro_id) prefix set value $(prefix)
$data modify storage multitag:user$(macro_id) suffix set value $(suffix)
$data modify storage multitag:user$(macro_id) nickname set value $(target)
$data modify storage multitag:user$(macro_id) macro_id set value $(macro_id)


