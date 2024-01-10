# Thanks macOS
if test (uname) = Darwin
    eval (/opt/homebrew/bin/brew shellenv)
    ulimit -n 10240
end

if test (uname) = Linux
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end
