# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 5:"

    log "... step 5.1: creating DB users"
	sudo -i -u postgres createuser -U postgres -d -s $ERRATA_DB_USER_ADMIN
	sudo -i -u postgres createuser -U $ERRATA_DB_USER_ADMIN -D -S -R $ERRATA_DB_USER_APP

    log "... step 5.2: creating DB"
	sudo -i -u postgres createdb -U $ERRATA_DB_USER_ADMIN -e -O $ERRATA_DB_USER_ADMIN -T template0 $ERRATA_DB_NAME

    log "... step 5.3: setting DB permissions"
	sudo -i -u postgres psql -U $ERRATA_DB_USER_ADMIN -d $ERRATA_DB_NAME -q -f $INSTALLER_HOME/templates/db_permissions.sql

    # log "... step 5.4: creating DB objects"
	# pushd /opt/esdoc-errata-ws
	# pipenv run python $INSTALLER_HOME/sh/step_05.py
	# popd

    log "END step 5"
}

# Invoke entry point.
main
