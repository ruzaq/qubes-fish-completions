function __qvm_vms -d 'All qubes, class as description'
    qvm-ls --raw-data --fields NAME,CLASS 2>/dev/null | string replace '|' \t
end
