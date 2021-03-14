#!/usr/bin/env bash

# Import utils.
source $OPAL_HOME/sh/utils.sh

#######################################
# Backups a database backup.
# Arguments:
#   Deployment environment.
#   Database type.
#######################################
main()
{
    local ENV=${1}
    local DB_TYPE=${2}

    echo "TODO: backup $ENV $DB_TYPE db"
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
