function __qvm_running_vms -d 'Running qubes'
    qvm-ls --running --raw-data --fields NAME,CLASS 2>/dev/null | string replace '|' \t
end
