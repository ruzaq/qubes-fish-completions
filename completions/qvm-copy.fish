# qvm-copy opens a GUI for destination selection; only file args are relevant
complete -c qvm-copy -l without-progress  -d "Don't show progress indicator"
complete -c qvm-copy -l with-progress     -d 'Show progress indicator (default)'
complete -c qvm-copy -l ignore-symlinks   -d 'Skip symbolic links'
complete -c qvm-copy -l no-ignore-symlinks -d 'Follow symbolic links (default)'
complete -c qvm-copy -s h -l help         -d 'Show help'
