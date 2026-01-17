# The dotfiles for my Hyprland setup modified to work universally with all (most) setups
### ⚠️ This is currently a work in progress. 
### Things might be a little buggy, or just straight up not work at all, and I have not made an install script yet.

<img src="images/homescreen.png" alt="terminal screenshot" width="500"/>

<img src="images/lockscreen.png" alt="lockscreen screenshot" width="500"/>

## ⚠️ This is made for Arch and may not work properly on other distros.

#### Required packages:

- hyprland*
- hypridle*
- hyprlock*
- waybar*
- wofi*
- wl-clipboard
- grim
- slurp
- jq
- playerctl
- pipewire*
- pipewire-pulse*
- wireplumber*
- pipewire-alsa*
- pavucontrol
- network-manager
- network-manager-applet
- polkit-kde-agent*
- swww*
- mpvpaper (AUR)
- mangohud
- swaync
- cliphist
- kitty
- dolphin*
- librewolf-bin (AUR)
- mission-center
- python*
- tk*
- cpupower
- fastfetch
- ttf-firacode-nerd (or any nerd font)
- noto-fonts-emoji
<br><br>
#### Easy install:
```
sudo pacman -S --needed hyprland hypridle hyprlock waybar wofi wl-clipboard grim slurp jq playerctl pipewire pipewire-pulse wireplumber pipewire-alsa pavucontrol network-manager-applet polkit-kde-agent swww mangohud swaync cliphist kitty dolphin mission-center python tk cpupower fastfetch ttf-firacode-nerd
```
Using an AUR helper like yay or paru:
```
yay -S mpvpaper librewolf-bin
```

**Click `Code` > `Download ZIP` > move all the config files into .config**

---

Remember to add these to your `~/.bashrc`:
```
PS1='[\u@\h \W]\$ '
export STARSHIP_LOG=error
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
```
Make sure you have made visudo not prompt you for a password when using sudo,
otherwise some of the scripts won't function properly.
```
%wheel ALL=(ALL:ALL) NOPASSWD: ALL
```
⚠️ Keep in mind that while this is the easy route, it's also a security risk, and I am working on a better universal system.
<br><br>

#### Keyboard shortcuts:

- `Super` - Open application launcher (wofi)
- `Super + T` - Open terminal (kitty)
- `Super + W` - Open browser (librewolf)
  * `Super + Shift + W` to open a private window

- `Super + Q` - Close focused application
- `Super + E` - Open file manager (dolphin)
- `Super + V` - Open clipboard history
- `Super + . (period) ` - Open emoji picker
  * Left and right arrow to switch between skintones
- `Super + J` - Toggle split layout
- `Super + Left ALT + R` - Open power options
- `Super + Ctrl + Arrow keys` - Swap position for focused window
- `Super + L` - Lock the screen
- `Ctrl + Shift + Esc` - Open missioncenter
<br><br>
- `Left ALT + Print Screen` - Take a screenshot of the whole screen
- `Ctrl + Print Screen` - Take a screenshot of the focused monitor
- `Shift + Print Screen` - Take a screenshot of the focused window
- `Print Screen` - Take a screenshot of a selected region
