# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    installer_log "... setting up postgres"
    
    # TODO: invoke these scripts with correct environment variables.
    source /opt/esdoc/esdoc-errata-ws/db_install.sh
    source /opt/esdoc/esdoc-errata-ws/db_setup.sh
}

# Invoke entry point.
main
