# エラーが発生したら終了する
set -e

# 設定ファイル読み込み
. .env

# wp-cli のインストール
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# WordPress 初期設定
wp core install --url="http://localhost:$PORT" --title="$WP_TITLE" \
	--admin_user="$WP_USER" --admin_password="$WP_PASSWORD" \
	--admin_email="$WP_EMAIL" --allow-root
wp plugin uninstall hello --allow-root
wp plugin install all-in-one-wp-migration --activate --allow-root
wp core language install ja --activate --allow-root
wp plugin install wp-multibyte-patch --activate --allow-root

# ファイルアップロード　上限引き上げ
echo "php_value memory_limit 600M" >> .htaccess
echo "php_value post_max_size 600M" >> .htaccess
echo "php_value upload_max_filesize 512M" >> .htaccess
