prev_state=""
sleep 10
while true; do
    windows=$(hyprctl activeworkspace -j | jq -r '.windows')
    if [ "$windows" -gt 0 ]; then
        new_state="black"
    else
        new_state="transparent"
    fi
    if [ "$new_state" != "$prev_state" ]; then
        echo "@define-color bg $new_state;" > /home/mishal/.config/waybar/dynamic-bg.css
        pkill -SIGUSR2 waybar
        prev_state="$new_state"
    fi
    sleep 1
done
