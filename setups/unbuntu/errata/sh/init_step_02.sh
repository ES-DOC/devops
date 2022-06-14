# Main entry point.
main()
{
    installer_log "... initialising system"

    apt update
    apt upgrade
}

# Invoke entry point.
main
