# Main entry point.
main()
{
    installer_log "... setting up postgres"

    source /opt/esdoc/esdoc-errata-ws/db_install.sh
    source /opt/esdoc/esdoc-errata-ws/db_setup.sh
}

# Invoke entry point.
main