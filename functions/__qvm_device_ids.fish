function __qvm_device_ids -d 'Devices of the class given as the first positional argument'
    set -l cls (__qvm_pos_arg 1)
    test -n "$cls"; or return
    qvm-device $cls list 2>/dev/null | string match -rv '^BACKEND' | string replace -r '^(\S+)\s+' '$1\t'
end
