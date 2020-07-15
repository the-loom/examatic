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

dev_seed:
	docker-compose run web rake db:setup db:seed

build:
	$(MAKE) stop
	$(MAKE) mine
	docker-compose build
	docker-compose run web bundle install --no-deployment

console:
	docker-compose run web rails console

rubocop:
	docker-compose run web bundle exec rubocop --auto-correct

rbp:
	docker-compose run web bundle exec rails_best_practices -f html .

migrate:
	docker-compose run web bundle exec rake db:migrate

routes:
	docker-compose run web bundle exec rake routes

logs:
	docker-compose logs -tf

use_production_db:
	$(MAKE) stop
	heroku pg:backups capture --app examatic
	heroku pg:backups download --app examatic
	mv latest.dump tmp/latest.dump
	docker-compose run web bundle exec rake db:drop db:create
	docker cp tmp/latest.dump examatic_db_1:/latest.dump
	! docker exec examatic_db_1 pg_restore --verbose --clean --no-acl --no-owner -h localhost -d examatic_development -U examatic /latest.dump
	$(MAKE) migrate

production_deploy:
	heroku maintenance:on --app examatic
	git push -ff production master
	heroku pg:killall --app examatic
	heroku run rake db:migrate --app examatic
	heroku ps:scale web=1 --app examatic
	heroku restart --app examatic
	heroku maintenance:off --app examatic
