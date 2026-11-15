execute if entity @s[scores={plm_prank_level=1}] run function multitag:admin/set_suffix_self {suffix:[{text:" ❶",color:"gray"}]}
execute if entity @s[scores={plm_prank_level=2}] run function multitag:admin/set_suffix_self {suffix:[{text:" ❷",color:"yellow"}]}
execute if entity @s[scores={plm_prank_level=3}] run function multitag:admin/set_suffix_self {suffix:[{text:" ❸",color:"red"}]}
execute if entity @s[scores={plm_prank_level=4}] run function multitag:admin/set_suffix_self {suffix:[{text:" ❹",color:"dark_red"}]}
scoreboard players set @s plm_operation 0
scoreboard players set @s plm_time 0
tag @s remove plm_operation_ready