function update --description 'Update installed software'
    chezmoi update
    echo "updating homebrew installed software"
    brew update
    brew upgrade
    echo "updating fisher plugins"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher install PatrickF1/fzf.fish
    fisher install rstacruz/fish-asdf
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
    cp ~/.local/share/nvim/lazy/vim-kitty-navigator/*.py ~/.config/kitty/
end
