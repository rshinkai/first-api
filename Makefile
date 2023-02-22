RAILS := rails

.PHONY: run test db-cli console

run:
	$(RAILS) s

test:
	$(RAILS) test

db-cli:
	$(RAILS) db

console:
	$(RAILS) console
