.PHONY: usage sync test migrate

sync-dir = ~/tmp-project-mirror

usage:
	@echo ''
	@echo SYNOPSIS
	@echo '     'make \[migrate \| test\]
	@echo ''
	@echo OPTIONS
	@echo '     'migrate
	@echo '             'rails db:migrate db:seed
	@echo '     'test
	@echo '             'rails test
	@echo ''

sync:
	rsync -avz --delete ./ $(sync-dir)
	@echo "\n===============================================================================\n"

test: sync
	cd $(sync-dir) && \
rails test

migrate:
	rm db/*.sqlite3 db/schema.rb
	rails db:migrate db:seed
