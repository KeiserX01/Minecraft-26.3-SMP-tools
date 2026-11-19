$data modify storage user-profile:user$(macro_id) nickname set value $(nickname)
$data modify storage user-profile:user$(macro_id) macro_id set value $(macro_id)
$function user-profile:trigger/op with storage user-profile:user$(macro_id)
