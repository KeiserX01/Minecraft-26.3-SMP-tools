tag @s add headinchat
data modify storage headinchat:data uuid set from entity @s UUID
data modify storage headinchat:data team set from storage headinchat:data uuid[0]
function headinchat:team with storage headinchat:data
