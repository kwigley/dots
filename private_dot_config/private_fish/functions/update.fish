function update -d "Update installed software"
  echo "update macos"
  softwareupdate -i -a
  echo "updating homebrew installed software"
  brew bundle install --file (chezmoi source-path)/Brewfile
  echo "updating fisher plugins"
  fisher update
  echo "updating neovim"
  brew upgrade --build-from-source neovim --fetch-HEAD
  echo "updating neovim plugins"
  nvim --headless +PackerUpdate +PackerSync +qa
end

