#!/bin/bash

{
    FILES=(
        "$HOME/.config/hypr/scripts/screenshot/region.sh"
        "$HOME/.config/hypr/scripts/screenshot/monitor.sh"
        "$HOME/.config/hypr/scripts/screenshot/window.sh"
        "$HOME/.config/hypr/scripts/screenshot/fullscreen.sh"
        "$HOME/.config/hypr/scripts/close.sh"
        "$HOME/.config/hypr/scripts/power_menu.sh"
        "$HOME/.config/hypr/scripts/power_restore.sh"
        "$HOME/.config/hypr/scripts/power_save.sh"
        "$HOME/.config/wofi/emoji-picker/emoji-picker.sh"
        "$HOME/.config/waybar/scripts/volume-toggle.sh"
    )

    echo "------------------------------------------"
    echo "🚀 Starting File Permissions Update"
    echo "------------------------------------------"

    for FILE in "${FILES[@]}"; do
        # Check if the file exists
        if [ -f "$FILE" ]; then
            chmod +x "$FILE"
            echo "✅ SUCCESS: Made executable -> $FILE"
        else
            echo "❌ ERROR: File not found    -> $FILE"
        fi
    done

    echo "------------------------------------------"
    echo "🎉 All tasks complete!"
}
