complete -c qvm-backup-restore

# 1st positional arg: backup location (file/path) — file completion
# 2nd+ positional args: VM names to restore (empty = restore all)
complete -c qvm-backup-restore -n 'test (__qvm_count_pos_args) -ge 1' -f -a '(__qvm_vms)' -d 'VM to restore'

complete -c qvm-backup-restore -l verify-only          -d 'Verify backup integrity without restoring'
complete -c qvm-backup-restore -l skip-broken          -d 'Skip VMs that cannot be restored'
complete -c qvm-backup-restore -l ignore-missing       -d 'Ignore missing templates/netvms'
complete -c qvm-backup-restore -l skip-conflicting     -d 'Skip VMs that already exist'
complete -c qvm-backup-restore -l rename-conflicting   -d 'Rename conflicting VMs on restore'
complete -c qvm-backup-restore -l passphrase-file -r   -d 'Read decryption passphrase from file'
complete -c qvm-backup-restore -l location-is-service  -d 'Backup location is a qrexec service'
complete -c qvm-backup-restore -l auto-close           -d 'Close dialog automatically on success'
complete -c qvm-backup-restore -l paranoid-mode        -d 'Paranoid mode (untrusted backup)'
complete -c qvm-backup-restore -s x -l exclude -r -f -a '(__qvm_vms)' -d 'Exclude VM from restore'
complete -c qvm-backup-restore -s v -l verbose         -d 'Increase verbosity'
complete -c qvm-backup-restore -s q -l quiet           -d 'Decrease verbosity'
complete -c qvm-backup-restore -s h -l help            -d 'Show help'
