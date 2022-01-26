function update --description 'Update installed software'
    echo "update macos"
    softwareupdate -i -a
    echo "updating homebrew installed software"
    chezmoi update
    brew upgrade
    echo "updating fisher plugins"
    fisher update
    echo "updating rust deps"
    rustup update
    cargo install stylua
    echo "updating go deps"
    go install golang.org/x/tools/gopls@latest
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
    echo "updating asdf"
    asdf plugin-update --all
end
