if [ ! -e /var/www/wordpress/wp-config.php ]; then

cd /var/www/wordpress

wp config create	--allow-root \
			--dbname=$SQL_DATABASE \
			--dbuser=$SQL_USER \
			--dbpass=$SQL_PASSWORD \
			--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install		--url=$DOMAIN_NAME \
			--title=$SITE_TITLE \
			--admin_user=$SITE_ADMIN_USER \
			--admin_password=$SITE_ADMIN_PASSWORD \
			--admin_email=$SITE_ADMIN_EMAIL \
			--allow-root --path='/var/www/wordpress'

sleep 10

wp user create		$SITE_USER1_LOGIN $SITE_USER1_EMAIL \
			--allow-root \
			--role=author \
			--user_pass=$SITE_USER1_PASS \
			--path='/var/www/wordpress' >> /log.txt
fi

# (PHP-FastCGI Process Manager) en mode "foreground" (-F)
/usr/sbin/php-fpm7.3 -F
