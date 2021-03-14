#!/usr/bin/env bash

# Import utils.
source $OPAL_HOME/sh/utils.sh

#######################################
# Zips a database backup.
# Arguments:
#   Deployment environment.
#   Database type.
#######################################
main()
{
    local ENV=${1}
    local DB_TYPE=${2}
    local DB_NAME=db-"$DB_TYPE".sql
    local DIR_DB="$OPAL_HOME"/assets/"$ENV"/db

    pushd "$DIR_DB"
    tar -czvf "$DB_NAME".gz $DB_NAME  > /dev/null 2>&1
    popd

	opal_log "$DB_NAME compressed -> $DIR_DB/$DB_NAME.gz"
}

# ----------------------------------------------------------------
# ENTRY POINT
# ----------------------------------------------------------------

unset OPAL_ENV
unset DB_TYPE

for ARGUMENT in "$@"
do
    KEY=$(echo "$ARGUMENT" | cut -f1 -d=)
    VALUE=$(echo "$ARGUMENT" | cut -f2 -d=)
    case "$KEY" in
        env) ENV=${VALUE} ;;
        type) DB_TYPE=${VALUE} ;;
        *)
    esac
done

main "${ENV:-"test"}" "${DB_TYPE:-"documentation"}"
