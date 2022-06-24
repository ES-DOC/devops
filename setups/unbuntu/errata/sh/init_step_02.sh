# Main entry point.
main()
{
    apt install -q \
        nginx \
        postgresql \
        postgresql-contrib

    ufw allow 'Nginx Full'
}

# Invoke entry point.
main
