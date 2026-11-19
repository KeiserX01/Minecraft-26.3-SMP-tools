$team modify $(user_id) suffix [{text:" ",extra:[$(suffix),$(new_suffix)]}]
$data modify storage multitag:user$(user_id) suffix set value [{text:" ",extra:[$(suffix),$(new_suffix)]}]