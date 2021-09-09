function update --description 'Update installed software'
    echo "update macos"
    softwareupdate -i -a
    echo "updating homebrew installed software"
    chezmoi execute-template <~/.local/share/chezmoi/run_once_before_install-packages-darwin.sh.tmpl | sh
    echo "updating fisher plugins"
    fisher update
end
