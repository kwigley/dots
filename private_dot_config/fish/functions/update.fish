function update --description 'Update installed software'
    chezmoi update
    echo "update macos"
    softwareupdate -i -a
    echo "updating homebrew installed software"
    brew update
    brew upgrade
    echo "updating fisher plugins"
    fisher install
    fisher update
    echo "updating asdf"
    asdf plugin add nodejs
    asdf plugin add python
    asdf plugin add ruby
    asdf plugin-update --all
    asdf install
    echo "updating rust deps"
    rustup update
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
