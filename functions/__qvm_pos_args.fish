function __qvm_pos_args -d 'Positional arguments on the command line, option values skipped'
    # Options that take a value are listed per command in __qvm_valopts_<cmd>
    # (generated from --help). Without them 'qvm-run -u root <TAB>' would count
    # 'root' as the qube name.
    set -l tokens (commandline -opc)
    set -l var __qvm_valopts_(string replace -a -- - _ (path basename -- $tokens[1]))
    set -l valopts $$var
    set -l skip 0
    set -l only_pos 0
    for tok in $tokens[2..]
        if test $skip -eq 1
            set skip 0
            continue
        end
        if test $only_pos -eq 0
            if test "$tok" = --
                set only_pos 1
                continue
            end
            if string match -q -- '-*' $tok
                contains -- $tok $valopts; and set skip 1
                continue
            end
        end
        echo $tok
    end
end
