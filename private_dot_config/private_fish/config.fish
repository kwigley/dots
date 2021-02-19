# Abbreviations/Aliases
abbr --add senv 'source env/bin/activate.fish'
abbr --add d 'deactivate'
abbr --add vim 'nvim'
abbr --add n 'nvim'
abbr --add e 'code'
abbr --add tm 'tmux -2 new-session -A -s main'
abbr --add src 'source ~/.config/fish/config.fish'
abbr --add ch 'chezmoi'
abbr --add rd 'rm -r'
abbr --add c 'z'

# ENV vars
set PATH $PATH /Users/kwigley/.local/bin

set -g fish_user_paths "/usr/local/opt/luajit-openresty/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# External Configs
if test -f /usr/local/opt/asdf/asdf.fish
    source /usr/local/opt/asdf/asdf.fish
end
