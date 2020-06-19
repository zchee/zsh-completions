
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [[ $PMSPEC != *f* ]] {
    fpath=( "${0:h}/src/macOS" "${0:h}/src/go" "${0:h}/src/zsh" "${fpath[@]}" )
}
