# Make the completions easily autoloaded via a ZSH framework

ZSH_COMPLETIONS="$(dirname $0)"
export fpath=($fpath ${ZSH_COMPLETIONS})
unset ZSH_COMPLETIONS
