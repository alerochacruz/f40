#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Reconfigure key mappings using xmodmap
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Remove the right Shift key from the 'shift' modifier group
xmodmap -e "remove shift = Shift_R"
# Remove the right Alt key from the 'mod1' modifier group (mod1 is typically mapped to Alt)
xmodmap -e "remove mod1 = Alt_R"
# Clear the 'lock' modifier, which is usually associated with the Caps Lock key
xmodmap -e "clear lock"

# Remap the key with keycode 108 (usually Alt_R) to act as the right Shift key (Shift_R)
xmodmap -e "keycode 108 = Shift_R"
# Remap the key with keycode 62 (usually Shift_R) to act as the right Alt key (Alt_R)
xmodmap -e "keycode 62 = Alt_R"
# Remap the key with keycode 66 (usually Caps Lock) to act as the left Control key (Control_L)
xmodmap -e "keycode 66 = Control_L"

# Add the right Shift key (Shift_R) to the 'shift' modifier group
xmodmap -e "add shift = Shift_R"
# Add the right Alt key (Alt_R) to the 'mod1' modifier group
xmodmap -e "add mod1 = Alt_R"
# Add the left Control key (Control_L) to the 'Control' modifier group
xmodmap -e "add Control = Control_L"


# Revert back changes
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Clear all keys currently assigned to the Control modifier group
# xmodmap -e "clear Control"
# Clear all keys currently assigned to the Shift modifier group
# xmodmap -e "clear shift"
# Clear all keys currently assigned to the mod1 modifier group (typically associated with the Alt key)
# xmodmap -e "clear mod1"

# Remap the key with keycode 66 (usually Caps Lock) back to act as Caps Lock
# xmodmap -e "keycode 66 = Caps_Lock"
# Remap the key with keycode 62 (usually Alt_R) back to act as the right Shift key (Shift_R)
# xmodmap -e "keycode 62 = Shift_R"
# Remap the key with keycode 108 (usually Shift_R) back to act as the right Alt key (Alt_R)
# xmodmap -e "keycode 108 = Alt_R"

# Re-add Caps Lock to the 'Lock' modifier group (used for toggling Caps Lock functionality)
# xmodmap -e "add Lock = Caps_Lock"
# Re-add the right Shift key (Shift_R) to the 'shift' modifier group
# xmodmap -e "add shift = Shift_R"
# Re-add the right Alt key (Alt_R) to the 'mod1' modifier group
# xmodmap -e "add mod1 = Alt_R"

