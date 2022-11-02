# Imports.
source $INSTALLER_HOME/sh/utils/constants.sh
source $INSTALLER_HOME/sh/utils/general.sh

# Main entry point.
main()
{
    log "BEGIN step 6:"

    log "... step 6.1: initialising databases"
    _init_databases

    log "... step 6.2: creating DB schema + tables"
    _setup_databases

    log "END step 6"
}

# Initialises application databases.
function _init_databases() {
    # Create db objects.
    sudo -i -u postgres createuser esdoc
    sudo -i -u postgres createdb -O esdoc esdoc_documentation
    sudo -i -u postgres createdb -O esdoc esdoc_errata

    # Set db credentials.
    if [[ ! -d $INSTALLER_TARGET_DIR/devops/tmp ]]; then
        mkdir $INSTALLER_TARGET_DIR/devops/tmp
    fi
    cat >> $INSTALLER_TARGET_DIR/devops/tmp/creds.sql <<- EOM
ALTER USER $ERRATA_DB_USER PASSWORD '$ERRATA_DB_PWD';
EOM
    sudo -i -u postgres psql -d $ERRATA_DB_NAME -q -f $INSTALLER_TARGET_DIR/devops/tmp/creds.sql
    rm $INSTALLER_TARGET_DIR/devops/tmp/creds.sql
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
