tellraw @a {text:"Recuerda configurar plm:config cooldown",color:"green"}
scoreboard objectives add plm_operation dummy
scoreboard objectives add plm_time dummy
scoreboard objectives add plm_prank_level dummy

# trigger 
scoreboard objectives add plm-change-pranklv trigger
scoreboard players enable @a plm-change-pranklv