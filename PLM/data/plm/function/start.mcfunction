#execute if entity @s[scores={plm_operation=1}] run tellraw @s {text:"No puedes usar esta función aún. Espera a que tu cambio anterior sea aplicado para solicitar otro.",color:"red"}
#execute unless entity @s[scores={plm_operation=1}] run function plm:operations/set-player-timer
#execute unless entity @s[scores={plm_operation=0}] run scoreboard players set @s plm_operation 1
#$scoreboard players set @s plm_prank_level $(prank_level)