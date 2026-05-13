complete -c qvm-backup

# 1st positional arg: backup profile or destination path
complete -c qvm-backup -n 'test (__qvm_count_pos_args) -eq 0' \
    -f -a '(__qvm_backup_profiles)' -d 'Backup profile'

# 1st+ positional args: VM names to include
complete -c qvm-backup -f -a '(__qvm_vms)' -d 'VM to backup'

complete -c qvm-backup -s x -l exclude -r -f -a '(__qvm_vms)' -d 'Exclude VM'
complete -c qvm-backup -l dest-vm -r -f -a '(__qvm_running_vms)' -d 'Store backup inside this VM'
complete -c qvm-backup -l compress-filter -r \
    -f -a 'gzip\t"gzip compression" bzip2\t"bzip2 compression" xz\t"xz compression" zstd\t"zstd compression"' \
    -d 'Compression filter'
complete -c qvm-backup -l passphrase-file -r -d 'Read encryption passphrase from file'
complete -c qvm-backup -l yes             -d "Don't ask for confirmation"
complete -c qvm-backup -s v -l verbose    -d 'Increase verbosity'
complete -c qvm-backup -s q -l quiet      -d 'Decrease verbosity'
complete -c qvm-backup -s h -l help       -d 'Show help'
