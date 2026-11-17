$data modify storage user-profile:runtime base_cords set value $(base_cords)
$data modify storage user-profile:runtime portal_cords set value $(portal_cords)
$data modify storage user-profile:runtime birthday set value $(birthday)
$data modify storage user-profile:runtime discord set value $(discord)

function user-profile:macros/get-runtime with storage multitag:runtime
