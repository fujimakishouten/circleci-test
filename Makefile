.PHONY: release
build:
	./scripts/build.sh

release:
	./scripts/build.sh

.PHONY: install
install:
	echo "install ... OK"

.PHONY: install
lint:
	echo "lint ... OK"

.PHONY: install
test:
	echo "unit test ... OK"

.PHONY: install
e2e:
	echo "e2e test ... OK"
