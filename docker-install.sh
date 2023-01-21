#!/bin/sh
set -e

echo "🚀 Starting WordPress install! 🚀"

if [ ! -f wp-config.php ]; then
    echo "🚩 WordPress not found in $PWD! 🚩"
    ( set -x; sleep 9 )
    echo "⭐ Downloading WordPress... ⭐"
fi

if ! $(wp core is-installed); then
    echo "🧪 Initializing WordPress install! 🧪"

    wp core install \
        --url="$WP_URL" \
        --admin_user=$WP_USER \
        --admin_password=$WP_PASSWORD \
        --admin_email=$WP_EMAIL \
        --title="$WP_TITLE" \
        --skip-email \
        --skip-plugins

    echo "Initiallization ."
    
    wp core update
    
    wp core update-db

    wp option update blogdescription "$WP_DESCRIPTION"
    
    wp config set WP_DEBUG $WP_DEBUG --raw
    
    wp theme install $WP_THEME
    wp theme activate $WP_THEME
    echo "Initiallization .."
    
    wp rewrite structure '/%postname%/'
    
    wp plugin delete akismet hello

    if [ -n "$WP_PLUGINS" ]; then
        wp plugin install $WP_PLUGINS
        wp plugin activate --all
    fi
    
    if [ -f /app/initialize.sh ]; then
        sh /app/initialize.sh
    fi
    echo "Initiallization ..."

    chown -R xfs:xfs . || true
fi

echo "🚀 WordPress is ready! 🚀"