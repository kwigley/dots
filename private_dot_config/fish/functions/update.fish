function update --description 'Update installed software'
    chezmoi update
    echo "update macos"
    softwareupdate -i -a
    echo "updating homebrew installed software"
    brew update
    brew upgrade
    echo "updating fisher plugins"
    fisher update
    echo "updating rust deps"
    rustup update
    echo "updating asdf"
    asdf plugin-update --all
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
