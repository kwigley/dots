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
    fisher install gazorby/fish-abbreviation-tips
    fisher install gazorby/fish-exa
    fisher install jethrokuan/z
    fisher install jhillyerd/plugin-git
    fisher install lilyball/nix-env.fish
    fisher install oakninja/MakeMeFish
    fisher install pure-fish/pure
    fisher update
    echo "updating asdf"
    asdf plugin add nodejs
    asdf plugin add python
    asdf plugin add ruby
    asdf plugin-update --all
    asdf install
    echo "updating rust deps"
    rustup-init -y
    rustup update
    cargo install --locked taplo-lsp
    echo "updating python deps"
    pip install -U -r ~/.default-python-packages
    pipx ensurepath
    pipx install pre-commit
    pipx install tox
    pipx install flake8
    pipx install black
    pipx upgrade-all
    echo "updating node deps"
    cat ~/.default-npm-packages | xargs npm i -g
    npm update -g
end
