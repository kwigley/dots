[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/kwigley/dots/main.svg)](https://results.pre-commit.ci/latest/github/kwigley/dots/main)

# dots

My config files for macOS managed by [`chezmoi`](https://www.chezmoi.io/)

## Install

`sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply kwigley/dots`

## Included Tools & Apps

- [neovim](https://neovim.io/) - text editor (👉 https://github.com/kwigley/nvim-dots)
- [kitty](https://sw.kovidgoyal.net/kitty/) - GPU based terminal emulator
- [fish](https://fishshell.com/) - user-friendly command line
  shell
- [alacritty](https://github.com/alacritty/alacritty) - OpenGL terminal emulator
- [homebrew](https://brew.sh/) - Package Manager for macOS
- [asdf](https://asdf-vm.com/#/) - runtime version manager (for multiple versions of python, nodejs, lua, etc.)
- [amethyst](https://ianyh.com/amethyst/) - Automatic tiling window manager for macOS
- [docker](https://www.docker.com/products/docker-desktop) - container management
- [spotify](https://www.spotify.com/) - 🕺
- [visual-studio-code](https://code.visualstudio.com/) - text editor and code browsing
- [postico](https://eggerapps.at/postico/) - postgres client
- [tokyonight](https://github.com/folke/tokyonight.nvim) - color theming

see more in the [homebrew bundle](run_once_before_install-packages-darwin.sh.tmpl)

## Helpful Resources

- [Setting up GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
