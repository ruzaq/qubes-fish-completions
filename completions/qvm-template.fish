complete -c qvm-template -f

complete -c qvm-template -n 'test (__qvm_count_pos_args) -eq 0' -f -a '\
    list\t"List templates" \
    search\t"Search available templates" \
    info\t"Show template details" \
    install\t"Install a template" \
    reinstall\t"Reinstall an installed template" \
    download\t"Download template without installing" \
    remove\t"Remove a template" \
    purge\t"Remove template and all qubes based on it" \
    clean\t"Remove cached downloads"'

# reinstall / remove / purge: installed templates
complete -c qvm-template \
    -n 'test (__qvm_count_pos_args) -ge 1 && __fish_seen_subcommand_from reinstall remove purge' \
    -f -a '(__qvm_installed_templates)' -d 'Installed template'

# info: installed or available (complete installed; user types name for available)
complete -c qvm-template \
    -n 'test (__qvm_count_pos_args) -eq 1 && __fish_seen_subcommand_from info' \
    -f -a '(__qvm_installed_templates)' -d 'Template'

# list options
complete -c qvm-template -n '__fish_seen_subcommand_from list' -l installed   -d 'Show installed templates'
complete -c qvm-template -n '__fish_seen_subcommand_from list' -l available    -d 'Show available templates'
complete -c qvm-template -n '__fish_seen_subcommand_from list' -l extras       -d 'Show extra (unofficial) templates'
complete -c qvm-template -n '__fish_seen_subcommand_from list' -l upgradable   -d 'Show upgradable templates'
complete -c qvm-template -n '__fish_seen_subcommand_from list' -l all          -d 'Show all templates'
complete -c qvm-template -n '__fish_seen_subcommand_from list' -l updates-only -d 'Show only templates with updates'

# install / reinstall / download options
complete -c qvm-template -n '__fish_seen_subcommand_from install reinstall download' \
    -s p -l pool -r -f -a '(__qvm_pools)' -d 'Storage pool'

# global options
complete -c qvm-template -l repo-files -r   -d 'Use custom repo file'
complete -c qvm-template -l keyring -r      -d 'Use custom keyring'
complete -c qvm-template -l updatevm -r -f -a '(__qvm_running_vms)' -d 'VM used for downloads'
complete -c qvm-template -l enablerepo -r   -d 'Enable this repo'
complete -c qvm-template -l disablerepo -r  -d 'Disable this repo'
complete -c qvm-template -l yes             -d "Don't prompt for confirmation"
complete -c qvm-template -s v -l verbose    -d 'Increase verbosity'
complete -c qvm-template -s q -l quiet      -d 'Decrease verbosity'
complete -c qvm-template -s h -l help       -d 'Show help'
