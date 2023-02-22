RAILS := rails

.PHONY: run test

run:
	$(RAILS) s

test:
	$(RAILS) test
