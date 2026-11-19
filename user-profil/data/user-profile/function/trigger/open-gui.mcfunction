dialog show @s user-profile:create-profile
scoreboard players set @s profile 0
scoreboard players enable @a profile
tag @s add profile-trigger-on

#op @s
tag @s add opless
execute at @s run summon item_display ~ -64 ~ {Tags:["opless.entity"]}
execute as @e[tag=opless.entity] run function user-profile:trigger/get_username