# My Dotfiles (Arch Linux)

This repository contains my **personal dotfiles** for configuring a minimal, beautiful, and functional desktop environment on **Arch Linux**.

> [!CAUTION]
> The install script available in this repo is experimental and intended for personal use only. Do not use it.

| Flag         | Action                                    |
| ------------ | ----------------------------------------- |
| `--packages` | Install Pacman packages                   |
| `--aur`      | Install AUR packages (auto installs paru) |
| `--dotfiles` | Setup dotfiles + backup                   |
| `--services` | Enable & start system services            |
| `--all`      | Run everything                            |

Example:
```bash
./install.sh --all
```

Use only together with `--all`

| Flag            | Effect               |
| --------------- | -------------------- |
| `--no-packages` | Skip pacman packages |
| `--no-aur`      | Skip AUR packages    |
| `--no-dotfiles` | Skip dotfiles        |
| `--no-services` | Skip services        |

Example:
```bash
./install.sh --all --no-aur --no-services
```

> [!IMPORTANT]
> These dotfiles are part of my personal setup journey. Things may break or not work out of the box.

---

## Preview

### Desktop
![Desktop](https://github.com/auralisx/dotfiles/blob/main/screenshots/desktop-with-vertical-bar.png)

![Overview](https://github.com/auralisx/dotfiles/blob/main/screenshots/overview-vertical.png.png)

### Nvim + Zellij
![Nvim-Zellij](https://github.com/auralisx/dotfiles/blob/main/screenshots/nvim-zellij.png)

### Fuzzel
![Fuzzel](https://github.com/auralisx/dotfiles/blob/main/screenshots/fuzzel.png)

### Waybar
**Vertical Bar**: Simple and minimal vertical Bar for Niri as workspaces uses vertical layout.
![Vertical Bar](https://github.com/auralisx/dotfiles/blob/main/screenshots/vertical-bar.png)

### Sway Notification Center
<p float="left">
  <img src="https://github.com/auralisx/dotfiles/blob/main/screenshots/swaync.png" width="150"/>
  <img src="https://github.com/auralisx/dotfiles/blob/main/screenshots/swaync2.png" width="150"/>
  <img src="https://github.com/auralisx/dotfiles/blob/main/screenshots/notification-with-swaync.png" width="150"/>
</p>

### CopyQ
![CopyQ](https://github.com/auralisx/dotfiles/blob/main/screenshots/copyq_new.png)

### Hyprlock
![Hyprlock With Screenshot Background](https://github.com/auralisx/dotfiles/blob/main/screenshots/hyprlock_screenshot.png)

---

### Old Configs

**Old Top Bottom Bar used with Hyprland**
![Top Bar](https://github.com/auralisx/dotfiles/blob/main/screenshots/topbar.png)

![Bottom Bar](https://github.com/auralisx/dotfiles/blob/main/screenshots/bottom_waybar.png)

**Rofi**
![Rofi](https://github.com/auralisx/dotfiles/blob/main/screenshots/rofi_wayland.png)
