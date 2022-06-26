# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 5:"

	log "... step 5.1: initialising database server"
	sudo -i -u postgres  /usr/lib/postgresql/14/bin/initdb /var/lib/pgsql/data
	sudo -i -u root service postgresql restart

    # log "... step 5.2: creating DB users"
	# sudo -i -u postgres createuser -U postgres -d -s errata_db_user_admin
	# sudo -i -u postgres createuser -U errata_db_user_admin -D -S -R $ERRATA_DB_USER_APP

    log "... step 5.2: creating DB"
	sudo -i -u postgres createdb -U postgres -e -O postgres -T template0 $ERRATA_DB_NAME

    # log "... step 5.3: setting DB permissions"
	# sudo -i -u postgres psql -U $ERRATA_DB_USER_ADMIN -d $ERRATA_DB_NAME -q -f $INSTALLER_HOME/templates/db_permissions.sql

    log "END step 5"
}

# Invoke entry point.
main
