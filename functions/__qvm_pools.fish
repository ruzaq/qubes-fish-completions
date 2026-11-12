function __qvm_pools -d 'Storage pools'
    qvm-pool list 2>/dev/null | string match -rv '^NAME' | string replace -r '^(\S+)\s+' '$1\t'
end
