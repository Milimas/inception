WP_CLI=wp-cli --allow-root
WP_CONFIG = /var/www/wordpress/wp-config.php
start: install
	php-fpm81 -F

install: configure 

configure: $(WP_CONFIG)

$(WP_CONFIG):
	#ln -s /usr/bin/php81 /usr/bin/php
	@echo "⚙️ Configuring Wordpress database..."
	$(WP_CLI) core download --path=wordpress
	$(WP_CLI) core config \
		--dbhost=${WORDPRESS_DB_HOST} \
		--dbname=${WORDPRESS_DB_NAME} \
		--dbuser=${WORDPRESS_DB_USER} \
		--dbpass=${WORDPRESS_DB_PASSWORD} \
		--locale=${WORDPRESS_LOCALE} \
		--path=/var/www/wordpress \
		--skip-check

	@echo "⚙️ Configuring Wordpress parameters..."
	$(WP_CLI) core install \
		--url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} \
		--title="$(WORDPRESS_WEBSITE_TITLE)" \
		--admin_user=${WORDPRESS_ADMIN_USER} \
		--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL} \
		--path=/var/www/wordpress

	$(WP_CLI) option update siteurl "${WORDPRESS_WEBSITE_URL}" \
		--path=/var/www/wordpress
	$(WP_CLI) rewrite structure $(WORDPRESS_WEBSITE_POST_URL_STRUCTURE) \
		--path=/var/www/wordpress
