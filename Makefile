PREFIX=/usr/local/
DOCKER_TAG = kbai/ocropy
DOCKER_ARGS =

.PHONY: docker

docker:
	docker build -t "$(DOCKER_TAG)" $(DOCKER_ARGS) .

docker-cached:
	$(MAKE) docker DOCKER_ARGS="--build-arg=http_proxy=http://10.42.0.2:3142"

install:
	@mkdir -p $(PREFIX)/bin
	@cp -t $(PREFIX)/bin run-ocropy
	@chmod a+x $(PREFIX)/bin/run-ocropy
