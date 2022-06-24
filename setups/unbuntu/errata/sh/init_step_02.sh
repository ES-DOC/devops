# Main entry point.
main()
{
    apt install -qq \
        nginx \
        postgresql \
        postgresql-contrib

    ufw allow 'Nginx Full'
}

# Invoke entry point.
main
