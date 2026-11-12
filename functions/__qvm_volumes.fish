function __qvm_volumes -d 'VM:VOLUME pairs'
    for vm in (qvm-ls --raw-list 2>/dev/null)
        printf '%s\n' $vm:root $vm:private $vm:volatile
    end
end
