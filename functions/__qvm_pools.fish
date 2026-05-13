function __qvm_pools -d 'List QubesOS storage pools'
    qvm-pool list 2>/dev/null | awk 'NR>1 {print $1}'
end
