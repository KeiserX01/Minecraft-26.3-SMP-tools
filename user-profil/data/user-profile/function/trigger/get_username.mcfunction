execute at @s run tag @n[type=item_display] add opless.entity
item replace entity @e[tag=opless.entity,limit=1] contents with minecraft:player_head
execute as @a[tag=opless] run item modify entity @n[tag=opless.entity,limit=1] contents {type:"minecraft:fill_player_head",entity:"this"}
data modify storage user-profile:runtime nickname set from entity @s item.components."minecraft:profile".name
data modify storage user-profile:runtime macro_id set from entity @s item.components."minecraft:profile".id[0]
kill @e[tag=opless.entity]
function user-profile:trigger/save-on_user with storage user-profile:runtime