setup:
	bundle install
	yarn install
	yarn build
	yarn build:css
	bin/rails db:drop db:create db:migrate db:seed

start:
	bundle install
	yarn install
	yarn build
	yarn build:css
	rm ./tmp/pids/server.pid
	bin/dev

clean:
	bin/rails db:drop db:create db:migrate db:seed


check: test lint

lint:
	bundle exec rubocop -a
#	bundle exec slim-lint app/views/

test:
	bin/rails test

.PHONY: test
