complete -c qvm-volume -f

# 1st positional arg: subcommand
complete -c qvm-volume -n 'test (__qvm_count_pos_args) -eq 0' -f \
    -a 'info\t"Show volume info" list\t"List volumes" revert\t"Revert to previous snapshot" resize\t"Resize volume" import\t"Import data into volume" export\t"Export volume data"'

# 2nd positional arg: VM:volume — complete VM names, user appends :root/:private/:volatile
complete -c qvm-volume -n 'test (__qvm_count_pos_args) -eq 1 && __fish_seen_subcommand_from info revert resize import export' \
    -f -a '(__qvm_vms)' -d 'VM (append :root / :private / :volatile)'

complete -c qvm-volume -s h -l help -d 'Show help'
