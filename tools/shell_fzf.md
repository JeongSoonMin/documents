fzf
==================================
### Shell Utility
* 터미널에서 파일 및 폴더 검색에서 유용함
* 설치
* > brew install fzf
* > brew install fd
* 단축키 적용(zsh 터미널 기준)
* > vi .zshrc

```
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND='fd --type d --hidden --strip-cwd-prefix --exlucd .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
    local command=$1
    shift
    
    case "$command" in
        cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
        export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
        ssh)          fzf --preview 'dig {}'                   "$@" ;;
        *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
    esac
}
```
* > source .zshrc

### 사용법
* CTRL + T
* CTRL + R
* vi ** tab
* ls ** tab