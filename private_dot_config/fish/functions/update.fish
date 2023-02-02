function update --description 'Update installed software'
    chezmoi update
    echo "update macos"
    softwareupdate -i -a
    echo "updating homebrew installed software"
    brew update
    brew upgrade
    echo "updating fisher plugins"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher install PatrickF1/fzf.fish
    fisher install franciscolourenco/done
    fisher install gazorby/fish-abbreviation-tips
    fisher install gazorby/fish-exa
    fisher install halostatue/fish-direnv
    fisher install jethrokuan/z
    fisher install jhillyerd/plugin-git
    fisher install jorgebucaran/autopair.fish
    fisher install lilyball/nix-env.fish
    fisher install oakninja/MakeMeFish
    fisher install kwigley/pure
    fisher update
    echo "updating asdf"
    asdf plugin add nodejs
    asdf plugin add python
    asdf plugin add ruby
    asdf plugin-update --all
    CC=GCC asdf install
    asdf reshim
    echo "updating rust deps"
    rustup-init -y
    rustup update
    echo "updating python deps"
    pip install -U pip
    pip install -U -r ~/.default-python-packages
    pipx ensurepath
    pipx install pre-commit
    pipx upgrade-all
    echo "updating node deps"
    npm i --location=global --upgrade npm
    cat ~/.default-npm-packages | xargs npm i --location=global --upgrade
    npm update --location=global
    cp ~/.local/share/nvim/lazy/vim-kitty-navigator/*.py ~/.config/kitty/
end
