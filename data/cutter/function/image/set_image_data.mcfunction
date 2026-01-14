#> cutter:image/set_image_data
#
# This function sets the image data.
#
# @input $(image_data) {string[][]} The data to set  
# @input $(width) {number} The width of the image  
# @input $(height) {number} The height of the image  
# @input $(background_color) {string} The background color of the image  
# @input $(description) {string[]} The description on the right hand side  
# @writes storage cutter:image image_data  
# @writes storage cutter:image width  
# @writes storage cutter:image height  
# @writes storage cutter:image background_color  
# @writes storage cutter:image description  
# @writes storage cutter:image pixel_character.blank  
# @writes storage cutter:image pixel_character.chat  
# @writes storage cutter:image pixel_character.lore

data remove storage cutter:image image_data
data remove storage cutter:image width
data remove storage cutter:image height
data remove storage cutter:image background_color
data remove storage cutter:image description

$data modify storage cutter:image image_data set value $(image_data)
$data modify storage cutter:image width set value $(width)
$data modify storage cutter:image height set value $(height)
$data modify storage cutter:image background_color set value "$(background_color)"
$data modify storage cutter:image description set value $(description)

data modify storage cutter:image pixel_character.blank set value "　"
data modify storage cutter:image pixel_character.pixel set value "▌▌"
data modify storage cutter:image pixel_character.line_break set value '\n'

function cutter:image/process/generate
