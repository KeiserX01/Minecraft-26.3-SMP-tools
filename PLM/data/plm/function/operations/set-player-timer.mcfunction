execute store result score now plm_time run time query gametime
execute store result score cooldown plm_time run data get storage plm:config cooldown
scoreboard players operation @s plm_time = now plm_time
scoreboard players operation @s plm_time += cooldown plm_time

function plm:operations/timer