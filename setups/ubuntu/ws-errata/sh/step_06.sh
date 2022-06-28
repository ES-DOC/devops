# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_SHARED/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 6:"

    log "... step 6.1: initialising DB"
    _init_db

    log "... step 6.1: creating DB schema + tables"
	pushd /opt/esdoc-errata-ws
	pipenv run python $INSTALLER_HOME/sh/step_06.py
	popd

    log "END step 6"
}

# Initialises application database.
function _init_db() {
    # Create db objects.
    sudo -i -u postgres createuser esdoc
    sudo -i -u postgres createdb -O esdoc esdoc_errata

    # Set db credentials.
    if [[ ! -d /opt/devops/tmp ]]; then
        mkdir /opt/devops/tmp
    fi
    cat >> /opt/devops/tmp/creds.sql <<- EOM
ALTER USER $ERRATA_DB_USER PASSWORD '$ERRATA_DB_PWD';
EOM
    sudo -i -u postgres psql -d $ERRATA_DB_NAME -q -f /opt/devops/tmp/creds.sql
    rm /opt/devops/tmp/creds.sql
}

# Invoke entry point.
main
