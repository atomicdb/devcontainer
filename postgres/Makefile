IMAGE_NAME := pgdevcontainer
IMAGE_TAG := bookworm

.PHONY: all
all: build

.PHONY: build
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

.PHONY: rebuild
rebuild:
	docker build --no-cache -t $(IMAGE_NAME):$(IMAGE_TAG) .

.PHONY: push
push:
	docker push $(IMAGE_NAME):$(IMAGE_TAG)

PHONY: clean
clean:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG) || true

.PHONY: help
help:
	@echo "Makefile usage:"
	@echo "  make          - Build the Docker image (default target)"
	@echo "  make build    - Build the Docker image"
	@echo "  make rebuild  - Rebuild the Docker image without using cache"
	@echo "  make push     - Push the Docker image to the repository"
	@echo "  make clean    - Clean intermediate files and remove the Docker image"
	@echo "  make help     - Display this help message"
