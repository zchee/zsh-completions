# Make the completions easily autoloaded via a ZSH framework

GO_COMPLETIONS="$(dirname $0)"
export fpath=($fpath ${GO_COMPLETIONS})
unset GO_COMPLETIONS
