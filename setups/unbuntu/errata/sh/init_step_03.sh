# Main entry point.
main()
{
    installer_log "... initialising postgres"

    apt install postgresql postgresql-contrib
}

# Invoke entry point.
main
