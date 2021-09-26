#!/usr/bin/env bash

# Import utils.
source $OPAL_HOME/sh/utils.sh

#######################################
# Restores a database backup.
# Arguments:
#   Deployment environment.
#   Database type.
#######################################
main()
{
    local ENV=${1}
    local DB_IDX=${2}
    local DB_TYPE=${3}
    local DB_BACKUP_NAME=db-"$DB_TYPE".sql
    local DB_NAME="$ENV_db_$DB_TYPE_$DB_IDX"
    local DB_USER="$ENV_db_$DB_TYPE_$DB_IDX"
    local DIR_DB="$OPAL_HOME"/assets/"$ENV"/db
    
    pushd "$DIR_DB"
    psql -U "$DB_USER" "$DB_NAME" -f ./"$DB_BACKUP_NAME" -q
    popd
}

# ----------------------------------------------------------------
# ENTRY POINT
# ----------------------------------------------------------------

unset OPAL_ENV
unset DB_IDX
unset DB_TYPE

for ARGUMENT in "$@"
do
    KEY=$(echo "$ARGUMENT" | cut -f1 -d=)
    VALUE=$(echo "$ARGUMENT" | cut -f2 -d=)
    case "$KEY" in
        env) OPAL_ENV=${VALUE} ;;
        idx) DB_IDX=${VALUE} ;;
        type) DB_TYPE=${VALUE} ;;
        *)
    esac
done

main "${OPAL_ENV:-"test"}" "${DB_IDX:-"1"}" "${DB_TYPE:-"documentation"}"
