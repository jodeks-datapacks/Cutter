# Copy current pixel
data modify storage cutter:image current.pixel_color set \
  from storage cutter:image current.image_data[0]
data modify storage cutter:image current.description_text set \
  from storage cutter:image current.description[0]

scoreboard players add $index.image_data cutter.image 1

# Calculate column
scoreboard players operation $index.column cutter.image = $index.image_data cutter.image
scoreboard players operation $index.column cutter.image %= $width cutter.image

# Calculate row
scoreboard players operation $index.row cutter.image = $index.image_data cutter.image
scoreboard players operation $index.row cutter.image /= $width cutter.image

# Append start spacing
execute if score $index.column cutter.image matches 1 run \
  function cutter:image/process/append/blank

# Append colored pixel
execute unless data storage cutter:image current{pixel_color: ''} run \
  function cutter:image/process/append/pixel
# Append background pixel
execute if data storage cutter:image current{pixel_color: ''} run \
  function cutter:image/process/append/background

# Append description
execute if score $index.column cutter.image matches 0 run \
    function cutter:image/process/image_end/description

# Remove first element from the image_data array
data remove storage cutter:image current.image_data[0]
# Loop over rows
execute if score $index.row cutter.image < $height cutter.image run \
  function cutter:image/process/loop_over_image_data
 