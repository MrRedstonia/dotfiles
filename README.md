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
- bash
- starship
- git
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

---

### Easy install:

I have made a convenience script called `install.sh` that guides you through the installation.

Clone/Download the repo and run the script, or run it directly without cloning the repo first with this command (requires git and curl):

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/MrRedstonia/dotfiles/refs/heads/main/install.sh)"
```

### Manual install:

Alternatively, if you prefer, you can install it manually.

#### Install packages:
```
sudo pacman -S --needed hyprland hypridle hyprlock waybar wofi bash starship git wl-clipboard grim slurp jq playerctl pipewire pipewire-pulse wireplumber pipewire-alsa pavucontrol network-manager-applet polkit-kde-agent swww mangohud swaync cliphist kitty dolphin mission-center python tk cpupower fastfetch ttf-firacode-nerd noto-fonts-emoji
```
Using an AUR helper like yay or paru:
```
yay -S mpvpaper librewolf-bin
```

#### Clone the repo:
Using GitHub: Click `Code` > `Download ZIP`. Then move all the config files in the config folder into ~/.config

Using Git: `git clone https://github.com/MrRedstonia/dotfiles.git`. Then move all the config files in the config folder into ~/.config
<br><br>

Remember to add these to your `~/.bashrc`:
```
PS1='[\u@\h \W]\$ '
export STARSHIP_LOG=error
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
```

---

#### Sudo permissions:

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
