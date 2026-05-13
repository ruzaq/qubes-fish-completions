complete -c qvm-ls -f

# Output format
complete -c qvm-ls -l raw-list   -d 'Print only VM names, one per line'
complete -c qvm-ls -l raw-data   -d 'Print raw data (pipe-separated)'
complete -c qvm-ls -s O -l fields -r -d 'Comma-separated list of fields to show'

# Filtering
complete -c qvm-ls -l tags   -r -d 'Filter by tag'
complete -c qvm-ls -l class  -r -d 'Filter by class (AppVM, TemplateVM, ...)'

# Fields for -O / --fields
set -l qvm_ls_fields name qid class label template netvm state memory disk ip tags
complete -c qvm-ls -n '__fish_seen_argument -s O -l fields' -f -a "$qvm_ls_fields"

complete -c qvm-ls -s h -l help    -d 'Show help'
complete -c qvm-ls -l spinner      -d 'Show spinner while loading'
