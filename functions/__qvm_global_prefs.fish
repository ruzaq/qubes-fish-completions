function __qvm_global_prefs -d 'Global properties, current value as description'
    qubes-prefs 2>/dev/null | string replace -r '^(\S+)\s+[-D](?:\s+|$)' '$1\t'
end
