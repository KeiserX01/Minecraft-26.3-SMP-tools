$data modify storage multitag:user$(user_id) new_suffix set value $(new_suffix)
$function multitag:admin/add/write_suffix with storage multitag:user$(user_id)  
say "intermediate funca"