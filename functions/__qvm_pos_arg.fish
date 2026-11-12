function __qvm_pos_arg -a n -d 'N-th positional argument on the command line'
    set -l args (__qvm_pos_args)
    set -q args[$n]; and echo $args[$n]
end
