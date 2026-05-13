function __qvm_count_pos_args -d 'Count non-option args on current cmdline (excluding command itself)'
    set -l count 0
    for tok in (commandline -opc)[2..]
        if not string match -q -- '-*' $tok
            set count (math $count + 1)
        end
    end
    echo $count
end
