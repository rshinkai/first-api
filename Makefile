RAILS := rails

.PHONY: run test db-cli console migrate-reset

run:
	$(RAILS) s

test:
	$(RAILS) test

db-cli:
	$(RAILS) db

console:
	$(RAILS) console

migrate-reset:
	$(RAILS) db:migrate:reset
