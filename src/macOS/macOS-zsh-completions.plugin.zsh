# Make the completions easily autoloaded via a ZSH framework

MACOS_COMPLETIONS="$(dirname $0)"
export fpath=($fpath ${MACOS_COMPLETIONS})
unset MACOS_COMPLETIONS
