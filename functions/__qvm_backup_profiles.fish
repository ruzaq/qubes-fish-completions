function __qvm_backup_profiles -d 'List QubesOS backup profiles'
    for f in /etc/qubes/backup/*.conf
        string replace -r '\.conf$' '' -- (basename $f)
    end 2>/dev/null
end
