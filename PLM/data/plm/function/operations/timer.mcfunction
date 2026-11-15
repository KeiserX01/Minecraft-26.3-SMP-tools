execute as @a[scores={plm_operation=1}] if score now plm_time >= @s plm_time run tag @s add plm_operation_ready
execute as @a[tag=plm_operation_ready] run function plm:operations/change-level
execute store result score now plm_time run time query gametime

schedule function plm:operations/timer 5s