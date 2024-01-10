# Thanks macOS
if test (uname) = Darwin
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
    set -gx HOMEBREW_REPOSITORY /opt/homebrew
    ! set -q PATH; and set PATH ''
    set -gxa PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
    ! set -q MANPATH; and set MANPATH ''
    set -gxa MANPATH /opt/homebrew/share/man $MANPATH
    ! set -q INFOPATH; and set INFOPATH ''
    set -gxa INFOPATH /opt/homebrew/share/info $INFOPATH
    ulimit -n 10240
end

if test (uname) = Linux
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end
