function __qvm_paused_vms -d 'Paused qubes'
    qvm-ls --paused --raw-data --fields NAME,CLASS 2>/dev/null | string replace '|' \t
end
