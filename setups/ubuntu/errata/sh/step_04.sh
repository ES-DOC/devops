# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
	log "API-DB : installing ..."

	_db_create_users
	_db_create
	_db_setup
	_db_grant_permissions

	log "API-DB : installed"
}

# Create db users.
_db_create_users()
{
	log "Creating DB users"
	createuser -U $ERRATA_DB_USER_SUPER -d -s $ERRATA_DB_USER_ADMIN
	createuser -U $ERRATA_DB_USER_ADMIN -D -S -R $ERRATA_DB_USER_APP
}

# Create db.
_db_create()
{
	log "Creating DB"
	createdb -U $ERRATA_DB_USER_ADMIN -e -O $ERRATA_DB_USER_ADMIN -T template0 $ERRATA_DB_NAME
}

# Grant db permissions.
_db_grant_permissions()
{
	log "Granting DB permissions"
	psql -U $ERRATA_DB_USER_ADMIN -d $ERRATA_DB_NAME -q -f $INSTALLER_HOME/templates/db_permissions.sql
}

# Seed db.
_db_setup()
{
	pushd /opt/esdoc-errata-ws
	pipenv run python $INSTALLER_HOME/sh/step_04.py
	popd
}

# Invoke entry point.
main
