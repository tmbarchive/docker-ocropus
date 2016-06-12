DOCKER_TAG = kbai/ocropy

.PHONY: docker

docker:
	docker build -t "$(DOCKER_TAG)" .
