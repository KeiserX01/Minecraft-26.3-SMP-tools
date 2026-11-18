
#prefix
$data modify storage user_profile:user$(macro_id) prefix_text set from storage multitag:user$(macro_id) prefix.text
$data modify storage user_profile:user$(macro_id) prefix_italic set from storage multitag:user$(macro_id) prefix.italic
$data modify storage user_profile:user$(macro_id) prefix_underlined set from storage multitag:user$(macro_id) prefix.underlined
$data modify storage user_profile:user$(macro_id) prefix_color set from storage multitag:user$(macro_id) prefix.color
$data modify storage user_profile:user$(macro_id) prefix_strikethrough set from storage multitag:user$(macro_id) prefix.strikethrough
$data modify storage user_profile:user$(macro_id) prefix_obfuscated set from storage multitag:user$(macro_id) prefix.obfuscated
$data modify storage user_profile:user$(macro_id) prefix_bold set from storage multitag:user$(macro_id) prefix.bold
#suffix
$data modify storage user_profile:user$(macro_id) suffix_text set from storage multitag:user$(macro_id) suffix.text
$data modify storage user_profile:user$(macro_id) suffix_italic set from storage multitag:user$(macro_id) suffix.italic
$data modify storage user_profile:user$(macro_id) suffix_underlined set from storage multitag:user$(macro_id) suffix.underlined
$data modify storage user_profile:user$(macro_id) suffix_color set from storage multitag:user$(macro_id) suffix.color
$data modify storage user_profile:user$(macro_id) suffix_strikethrough set from storage multitag:user$(macro_id) suffix.strikethrough
$data modify storage user_profile:user$(macro_id) suffix_obfuscated set from storage multitag:user$(macro_id) suffix.obfuscated
$data modify storage user_profile:user$(macro_id) suffix_bold set from storage multitag:user$(macro_id) suffix.bold
#others
$data modify storage user_profile:user$(macro_id) base_cords set value "$(base_cords)"
$data modify storage user_profile:user$(macro_id) nickname set value $(nickname)
$data modify storage user_profile:user$(macro_id) portal_cords set value "$(portal_cords)"
$data modify storage user_profile:user$(macro_id) birthday set value "$(birthday)"
$data modify storage user_profile:user$(macro_id) discord set value "$(discord)"
$data modify storage user_profile:user$(macro_id) user_id set value "$(macro_id)"

$function user-profile:macros/prefix-dialog with storage user-profile:user$(macro_id)