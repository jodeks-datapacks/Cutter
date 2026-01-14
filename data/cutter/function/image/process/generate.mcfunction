#> cutter:image/process/generate
#
# This function generates the image data.

data modify storage cutter:image current.image_data set from storage cutter:image image_data
data modify storage cutter:image current.description set from storage cutter:image description
data modify storage cutter:image current.pixel_character set from storage cutter:image pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data cutter.image 0
# Set width
execute store result score $width cutter.image run data get storage cutter:image width
# Set height
execute store result score $height cutter.image run data get storage cutter:image height
# Set length
scoreboard players operation $length cutter.image = $width cutter.image
scoreboard players operation $length cutter.image *= $height cutter.image
# Clear remaining entries in tellraw
data remove storage cutter:image tellraw

# Add spacing on top
function cutter:image/process/append/line_break
# Loop over image data
function cutter:image/process/loop_over_image_data
# Add spacing on bottom
function cutter:image/process/append/line_break