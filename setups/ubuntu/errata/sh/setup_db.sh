# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
	log "API-DB : installing ..."

    createuser -U postgres -d -s errata_db_user_admin
	createuser -U errata_db_user_admin -D -S -R errata_db_user_app

    createdb -U errata_db_user_admin -e -O errata_db_user_admin -T template0 errata_db

    psql -U errata_db_user_admin -d errata_db -q -f $INSTALLER_HOME/templates/db_permissions.sql

	log "API-DB : installed"
}

# Seed db.
_db_setup()
{
	pushd /opt/esdoc-errata-ws
	pipenv run python $INSTALLER_HOME/sh/step_05.py
	popd
}

# Invoke entry point.
main
