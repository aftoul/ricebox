autoload -U colors && colors
# purple username
username() {
   echo "%{$fg[green]%}%n%{$reset_color%}"
}

# current directory, two levels deep
directory() {
   echo "%{$fg[blue]%}%~"
}

# current time with milliseconds
current_time() {
   echo "%*"
}

# returns 👾 if there are errors, nothing otherwise
return_status() {
   echo "%(?..!)"
}

# get git status
git_status() {
    git branch 2>/dev/null | sed -rn "s/\* (.*)/\1/p"
}

setopt promptsubst

precmd() {
    psvar[1]=$(git_status)
}

git_status_prompt() {
    echo "%U%{$fg_bold[yellow]%}%v%{$reset_color%}%u"
}

echo \
"WELCOME
TERMINAL
HELLO, WORLD!
YOU BACK?
AFT\'S TERMINAL" \
| shuf -n 1 | xargs figlet | lolcat

PROMPT="%B$(username)%b:%(1V.[.)$(git_status_prompt)%(1V.].)$(directory)%b\$ "
RPROMPT="$(return_status)"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
