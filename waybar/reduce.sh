#!/bin/bash
# This script sets the brightness to 10% if it's lower than 10% when decreasing.

# Get the current and max brightness values
current_brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)

# Calculate the 10% brightness level
min_brightness=$((max_brightness / 10))

# If current brightness is less than 10%, set it to 10%
if [ "$current_brightness" -lt "$min_brightness" ]; then
    brightnessctl set 10%
else
    brightnessctl set 5%-
fi

