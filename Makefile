init:
	cp .env wp-init.sh docs
	docker-compose exec wp chmod +x wp-init.sh
	docker-compose exec wp bash ./wp-init.sh

destroy:
	docker-compose down -v
	rm -rf docs
