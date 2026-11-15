data modify storage multitag:runtime team_id set value 0
execute store result storage multitag:runtime team_id int 1 run data get entity @s UUID[0]
data modify storage multitag:runtime prefix set from storage multitag:config default.prefix
data modify storage multitag:runtime suffix set from storage multitag:config default.suffix
function multitag:player/apply_team with storage multitag:runtime
data modify storage multitag:runtime team_id set value 0
