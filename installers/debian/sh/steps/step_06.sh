# Imports.
source $INSTALLER_HOME/sh/utils/constants.sh
source $INSTALLER_HOME/sh/utils/general.sh

# Main entry point.
main()
{
    log "BEGIN step 6:"

    log "... step 6.1: initialising dB users"
    _init_db_users

    log "... step 6.2: initialising dB objects"
    _init_db_objects

    log "... step 6.3: initialising dB permissions"
    _init_db_permissions
    
    log "... step 6.4: setting up dB schema + tables"
    _setup_databases

    log "END step 6"
}

# Initialises database users.
function _init_db_users() {
    # Create db users.
    sudo -i -u postgres createuser esdoc_dbuser_admin
    sudo -i -u postgres createuser esdoc_dbuser_documentation
    sudo -i -u postgres createuser esdoc_dbuser_errata

    # Set temporary db credentials file.
    cat >> $INSTALLER_TARGET_DIR/devops/tmp/creds.sql <<- EOM
ALTER USER esdoc_dbuser_documentation PASSWORD '$ADMIN_DB_PWD';
ALTER USER esdoc_dbuser_documentation PASSWORD '$DOCUMENTATION_DB_PWD';
ALTER USER esdoc_dbuser_errata        PASSWORD '$ERRATA_DB_PWD';
EOM

    # Register credentials with postgres.
    sudo -i -u postgres psql -q -f $INSTALLER_TARGET_DIR/devops/tmp/creds.sql

    # Remove temporary db credentials file.
    rm $INSTALLER_TARGET_DIR/devops/tmp/creds.sql
}

# Initialises database objects.
function _init_db_objects() {
    sudo -i -u postgres createdb -O esdoc_dbuser_admin esdoc_db_documentation
    sudo -i -u postgres createdb -O esdoc_dbuser_admin esdoc_db_errata
}

# Initialises database permissions.
function _init_db_permissions() {
    psql -U esdoc_dbuser_admin -d esdoc_db_documentation -q -f $INSTALLER_HOME/templates/db-permissions-documentation.sql
    psql -U esdoc_dbuser_admin -d esdoc_db_errata -q -f $INSTALLER_HOME/templates/db-permissions-errata.sql
}   

# Configures application databases.
function _setup_databases() {
	pushd $INSTALLER_TARGET_DIR/esdoc-documentation-ws
	pipenv run python $INSTALLER_HOME/sh/steps/step_06_db_documentation.py
	popd

	pushd $INSTALLER_TARGET_DIR/esdoc-errata-ws
	pipenv run python $INSTALLER_HOME/sh/steps/step_06_db_errata.py
	popd
}

# Invoke entry point.
main
