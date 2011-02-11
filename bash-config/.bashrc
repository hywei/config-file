
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls -hF  --color=always'
alias emacs='emacs -nw'
alias diff='colordiff'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias ..='cd ..'

PS1='[\u@\h \W]\$ '

export EDITOR="emacs"

#grep setting
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

# The following function will extract a wide range of compressed file types.
# syntax extract <file1> <file2> ...
# from "https://wiki.archlinux.org/index.php/Core_Utilities"
#extract() {
#    local c e i

#     (($#)) || return

#     for i; do
#         c=''
#         e=1

#         if [[ ! -r $i ]]; then
#             echo "$0: file is unreadable: \`$i'" >&2
#             continue
#         fi

#         case $i in
#         *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz))))
#                c='bsdtar xvf';;
#         *.7z  c='7z x';;
#         *.Z   c='uncompress';;
#         *.bz2 c='bunzip2';;
#         *.exe c='cabextract';;
#         *.gz  c='gunzip';;
#         *.rar c='unrar x';;
#         *.xz  c='unxz';;
#         *.zip c='unzip';;
#         *     echo "$0: unrecognized file extension: \`$i'" >&2
#                continue;;
#         esac

#         command $c "$i"
#         e=$?
#     done

#     return $e
# }

