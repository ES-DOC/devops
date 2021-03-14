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
    local DB_NAME=db-"$DB_TYPE".sql.gz
    local DIR_DB_TMP="$OPAL_HOME"/assets/"$ENV"/db-tmp
    local PATH_TO_DB="$OPAL_HOME"/assets/"$ENV"/db/"$DB_NAME"

    mkdir -p $DIR_DB_TMP
    cp $PATH_TO_DB $DIR_DB_TMP

    pushd "$DIR_DB_TMP"
    gzip -d "$DB_NAME"
    popd

	opal_log "$DB_NAME decompressed -> $DIR_DB/$DB_NAME"
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
