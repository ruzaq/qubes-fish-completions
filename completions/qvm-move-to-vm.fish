complete -c qvm-move-to-vm

# 1st positional arg: destination VM name
complete -c qvm-move-to-vm -n 'test (__qvm_count_pos_args) -eq 0' -f -a '(__qvm_vms)' -d 'Destination VM'

# 2nd+ positional args: files — default fish file completion, no -f flag needed

complete -c qvm-move-to-vm -l without-progress  -d "Don't show progress indicator"
complete -c qvm-move-to-vm -l with-progress      -d 'Show progress indicator (default)'
complete -c qvm-move-to-vm -l ignore-symlinks    -d 'Skip symbolic links'
complete -c qvm-move-to-vm -l no-ignore-symlinks -d 'Follow symbolic links (default)'
complete -c qvm-move-to-vm -s h -l help          -d 'Show help'
