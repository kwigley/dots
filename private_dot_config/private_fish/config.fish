# ENV vars
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PYTHONBREAKPOINT ipdb.set_trace
set -gx GPG_TTY (tty)

# Abbreviations/Aliases
abbr --add senv 'source env/bin/activate.fish'
abbr --add d 'deactivate'
abbr --add vim 'nvim'
abbr --add n 'nvim'
abbr --add e $EDITOR
abbr --add src 'source ~/.config/fish/config.fish'
abbr --add ch 'chezmoi'
abbr --add rd 'rm -r'
abbr --add c 'z'
abbr --add dotfiles $EDITOR ~/.config

# External Configs
set -g fish_user_paths "/usr/local/opt/luajit-openresty/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
if test -f /usr/local/opt/asdf/asdf.fish
    source /usr/local/opt/asdf/asdf.fish
end
