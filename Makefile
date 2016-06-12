PREFIX=/usr/local/
DOCKER_TAG = kbai/ocropy

.PHONY: docker

docker:
	docker build -t "$(DOCKER_TAG)" .

install:
	@mkdir -p $(PREFIX)/bin
	@cp -t $(PREFIX)/bin run-ocropy
	@chmod a+x $(PREFIX)/bin/run-ocropy
