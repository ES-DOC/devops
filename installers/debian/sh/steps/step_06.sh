# Imports.
source $INSTALLER_HOME/sh/utils/constants.sh
source $INSTALLER_HOME/sh/utils/general.sh

# Main entry point.
main()
{
    log "BEGIN step 6:"

    log "... step 6.1: initialising database -> DOCUMENTATION"
    _init_db_documentation

    log "... step 6.2: initialising database -> ERRATA"
    _init_db_errata

    log "... step 6.3: creating DB schema + tables -> DOCUMENTATION"
    _configure_db_documentation

    log "... step 6.4: creating DB schema + tables -> ERRATA"
    _configure_db_errata

    log "END step 6"
}

# Configures application database: documentation.
function _configure_db_documentation() {
	pushd $INSTALLER_TARGET_DIR/esdoc-documentation-ws
	pipenv run python $INSTALLER_HOME/sh/steps/step_06_db_documentation.py
	popd
}

# Configures application database: errata.
function _configure_db_errata() {
	pushd $INSTALLER_TARGET_DIR/esdoc-errata-ws
	pipenv run python $INSTALLER_HOME/sh/steps/step_06_db_errata.py
	popd
}

# Initialises application database: documentation.
function _init_db_documentation() {
    echo "TODO: initialise documentation database"
}

# Initialises application database: errata.
function _init_db_errata() {
    # Create db objects.
    sudo -i -u postgres createuser esdoc
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

# Invoke entry point.
main
