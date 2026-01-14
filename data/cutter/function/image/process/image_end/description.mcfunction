# Append blank
function cutter:image/process/append/blank

data modify storage cutter:image tellraw append \
  from storage cutter:image current.description_text

# Append blank
function cutter:image/process/append/blank

# Append line_break
execute unless score $index.image_data cutter.image = $length cutter.image \
  run function cutter:image/process/append/line_break

# Remove first element from the description
data remove storage cutter:image current.description[0]
 