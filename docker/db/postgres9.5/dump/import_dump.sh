for f in /dump/*; do
    case "$f" in
        *.sql) printf "  Import $f\n\n" && psql -h db -U cp_user cp_database -f "$f";
    esac
done