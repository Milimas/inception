WP_CLI=wp-cli --allow-root --path=/var/www/wordpress

WP_CONFIG=/var/www/wordpress/wp-config.php

start: install
	$(WP_CLI) plugin install redis-cache --activate
	cp /var/www/wordpress/wp-content/plugins/redis-cache/includes/object-cache.php /var/www/wordpress/wp-content/
	$(WP_CLI) plugin update --all
	chown -R nobody:nobody /var/www
	php-fpm81 -F

install: configure

configure: $(WP_CONFIG)

$(WP_CONFIG):
	$(WP_CLI) core download
	printf "define( 'WP_REDIS_HOST', '${REDIS_HOST}' );\n\
		define( 'WP_REDIS_PORT', '${REDIS_PORT}' );\n\
		define( 'WP_CACHE', true );\n\
		define('FTP_USER', '${FTP_USER}');\n\
		define('FTP_PASS', '${FTP_PASS}');\n\
		define('FTP_HOST', '${FTP_HOST}');\n\
		" | $(WP_CLI) core config \
		--dbhost=${DB_HOST} \
		--dbname=${DB_NAME} \
		--dbuser=${DB_USER} \
		--dbpass=${DB_PASS} \
		--skip-check \
		--extra-php
	$(WP_CLI) core install \
		--url=${WP_WEBSITE_URL_WITHOUT_HTTP} \
		--title="$(WP_WEBSITE_TITLE)" \
		--admin_user=${WP_ADMIN_USER} \
		--admin_password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL}
	$(WP_CLI) user create ${WP_USER} ${WP_USER_EMAIL} \
		--role=subscriber \
		--user_pass=${WP_USER_PASS}
	$(WP_CLI) option update siteurl "${WORDPRESS_WEBSITE_URL}"
