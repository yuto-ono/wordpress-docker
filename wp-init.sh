# wp-cli のインストール
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# WordPress 初期設定
wp core install --url="http://localhost:8000" --title="Title" \
	--admin_user="user" --admin_password="password" \
	--admin_email="example@example.com" --allow-root
wp plugin uninstall hello --allow-root
wp plugin install all-in-one-wp-migration --activate --allow-root
wp core language install ja --activate --allow-root
wp plugin install wp-multibyte-patch --activate --allow-root
