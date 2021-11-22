function update --description 'Update installed software'
    echo "update macos"
    softwareupdate -i -a
    echo "updating homebrew installed software"
    chezmoi execute-template <(chezmoi source-path)/run_once_before_install-packages-darwin.sh.tmpl | sh
    brew upgrade
    echo "updating fisher plugins"
    fisher update
    echo "updating rust deps"
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
end
