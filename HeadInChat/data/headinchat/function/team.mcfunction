$team add headinchat_$(team) {object:"player",player:{id:$(uuid)},shadow_color:0}
$team modify headinchat_$(team) prefix [{object:"player",player:{id:$(uuid)},shadow_color:0}," "]
$team join headinchat_$(team) @s
