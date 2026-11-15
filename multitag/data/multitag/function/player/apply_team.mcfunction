$execute store success score #created multitag.tmp run team add $(team_id)
execute if score #created multitag.tmp matches 1 run function multitag:player/configure_team with storage multitag:runtime
$team join $(team_id) @s
