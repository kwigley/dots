function get-update
chezmoi git pull -- --rebase && chezmoi diff
end
