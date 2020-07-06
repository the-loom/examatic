browser:
	google-chrome --new-window http://localhost:3000
	cat browser.tabs | xargs google-chrome

start:
	rm -f tmp/pids/server.pid
	docker-compose up

stop:
	docker-compose down
	rm -f tmp/pids/server.pid

mine:
	sudo chown -R 1000:1000 .

build:
	$(MAKE) stop
	$(MAKE) mine
	docker-compose build
	docker-compose run web bundle install --no-deployment

console:
	docker-compose run web rails console

migrate:
	docker-compose run web bundle exec rake db:migrate

routes:
	docker-compose run web bundle exec rake routes

logs:
	docker-compose logs -tf
