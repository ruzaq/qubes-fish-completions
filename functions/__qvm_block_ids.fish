function __qvm_block_ids -d 'Available block devices, description included'
    qvm-device block list 2>/dev/null | string match -rv '^BACKEND' | string replace -r '^(\S+)\s+' '$1\t'
end
