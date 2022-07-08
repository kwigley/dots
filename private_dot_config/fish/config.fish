# ENV vars
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PYTHONBREAKPOINT ipdb.set_trace
set -gx GPG_TTY (tty)
set -gx ASDF_DATA_DIR $HOME/.asdf
set -gx GOPATH $HOME/go

# Abbr/Aliases
abbr --add c z
abbr --add cat bat
abbr --add ch chezmoi
abbr --add d deactivate
abbr --add dots 'cd (chezmoi source-path)'
abbr --add e $EDITOR
abbr --add k kubectl
abbr --add n nvim
abbr --add nvim-dots 'cd $HOME/.config/nvim'
abbr --add pnx 'pnpm nx'
abbr --add rd 'rm -r'
abbr --add senv 'source env/bin/activate.fish'
abbr --add src 'source $HOME/.config/fish/config.fish'
abbr --add vim nvim

# External Configs
set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -g fish_user_paths "$GOPATH/bin" $fish_user_paths

if test -d /opt/homebrew/bin
    set -g fish_user_paths /opt/homebrew/bin $fish_user_paths
end
if test -d /usr/local/sbin
    set -g fish_user_paths /usr/local/sbin $fish_user_paths
end
if test -d /opt/homebrew/opt/luajit-openresty/bin
    set -g fish_user_paths /opt/homebrew/opt/luajit-openresty/bin $fish_user_paths
end
if test -d /usr/local/opt/luajit-openresty/bin
    set -g fish_user_paths /usr/local/opt/luajit-openresty/bin $fish_user_paths
end
if test -f /usr/local/opt/asdf/asdf.fish
    source /usr/local/opt/asdf/asdf.fish
end
if test -f /opt/homebrew/opt/asdf/asdf.fish
    source /opt/homebrew/opt/asdf/asdf.fish
end
if test -f $HOME/.config/fish/local.fish
    source $HOME/.config/fish/local.fish
end

# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 364A82
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
