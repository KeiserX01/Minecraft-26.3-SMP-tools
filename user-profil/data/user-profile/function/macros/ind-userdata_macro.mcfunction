
#prefix
$data modify storage user-profile:user$(macro_id) prefix set from storage multitag:user$(macro_id) prefix
#suffix
$data modify storage user-profile:user$(macro_id) suffix set from storage multitag:user$(macro_id) suffix
#others
$data modify storage user-profile:user$(macro_id) base_cords set value "$(base_cords)"
$data modify storage user-profile:user$(macro_id) nickname set value $(nickname)
$data modify storage user-profile:user$(macro_id) portal_cords set value "$(portal_cords)"
$data modify storage user-profile:user$(macro_id) birthday set value "$(birthday)"
$data modify storage user-profile:user$(macro_id) discord set value "$(discord)"
$data modify storage user-profile:user$(macro_id) user_id set value "$(macro_id)"

#$function user_profile:macros/prefix-dialog with storage user_profile:user$(macro_id)