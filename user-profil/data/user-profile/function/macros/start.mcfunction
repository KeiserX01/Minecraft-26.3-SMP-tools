$data modify storage user-profile:runtime base_cords set value "$(base_cords)"
$data modify storage user-profile:runtime portal_cords set value "$(portal_cords)"
$data modify storage user-profile:runtime birthday set value "$(birthday)"
$data modify storage user-profile:runtime discord set value "$(discord)"
data modify storage user-profile:runtime UUID set from entity @s UUID
data modify storage user-profile:runtime macro_id set from entity @s UUID[0]

function user-profile:macros/intermidiate/merge-userdata_int with storage user-profile:runtime
function user-profile:macros/ind-userdata_macro with storage user-profile:runtime
say "start funciona"