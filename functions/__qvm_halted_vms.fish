function __qvm_halted_vms -d 'Halted qubes'
    qvm-ls --halted --raw-data --fields NAME,CLASS 2>/dev/null | string replace '|' \t
end
