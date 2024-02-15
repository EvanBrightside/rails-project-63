install: # установить зависимости
	bundle install

lint: # запустить линтер
	bundle exec rubocop

test: # запустить тесты
	rake test

.PHONY: test
