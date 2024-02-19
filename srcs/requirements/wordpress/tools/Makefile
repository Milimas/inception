WP_CLI=wp-cli --allow-root --path=/var/www/wordpress

WP_CONFIG=/var/www/wordpress/wp-config.php

start: install
	php-fpm81 -F

install: configure

configure: $(WP_CONFIG)

$(WP_CONFIG):
	@echo "⚙️ Configuring Wordpress database..."
	$(WP_CLI) core download
	chown -R nobody:nobody /var/www/wordpress
	printf "define( 'WP_DEBUG', true );\ndefine( 'WP_REDIS_HOST', 'redis' );\ndefine( 'WP_REDIS_PORT', '6379' );\ndefine( 'WP_CACHE', true );" | $(WP_CLI) core config \
		--dbhost=${WORDPRESS_DB_HOST} \
		--dbname=${WORDPRESS_DB_NAME} \
		--dbuser=${WORDPRESS_DB_USER} \
		--dbpass=${WORDPRESS_DB_PASSWORD} \
		--locale=${WORDPRESS_LOCALE} \
		--skip-check \
		--extra-php
	@echo "⚙️ Configuring Wordpress parameters..."
	$(WP_CLI) core install \
		--url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} \
		--title="$(WORDPRESS_WEBSITE_TITLE)" \
		--admin_user=${WORDPRESS_ADMIN_USER} \
		--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL}
	
	$(WP_CLI) plugin install redis-cache
	$(WP_CLI) plugin update --all
	cp /var/www/wordpress/wp-content/plugins/redis-cache/includes/object-cache.php /var/www/wordpress/wp-content/
	$(WP_CLI) redis enable --activate
	$(WP_CLI) option update siteurl "${WORDPRESS_WEBSITE_URL}"
	$(WP_CLI) rewrite structure $(WORDPRESS_WEBSITE_POST_URL_STRUCTURE)
