function __qvm_block_ids -d 'List available block BACKEND:DEVICE_ID pairs'
    qvm-device block list 2>/dev/null | awk 'NR>1 {print $1}'
end
