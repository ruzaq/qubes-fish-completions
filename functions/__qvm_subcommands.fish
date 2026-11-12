function __qvm_subcommands -a cmd -d 'Subcommands of a qvm-* tool, from generated __qvm_subs_<cmd>'
    set -l var __qvm_subs_(string replace -a -- - _ $cmd)
    printf '%s\n' $$var
end
