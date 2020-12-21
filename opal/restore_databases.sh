#######################################
# Restores databases from backups.
# Globals:
#   HOME - current user's home directory.
#######################################
function main () {
    pushd $HOME/tmp

    psql -U test_db_documentation_1 test_db_documentation_1 -f ./db-documentation.sql -q
    psql -U test_db_errata_1 test_db_errata_1 -f ./db-errata.sql -q

    popd
}

# Invoke entry point.
main