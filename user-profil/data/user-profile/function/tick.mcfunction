execute as @a[scores={profile=1..}] run function user-profile:trigger/open-gui
execute unless entity @a[tag=profile-trigger-on] run scoreboard players enable @a profile