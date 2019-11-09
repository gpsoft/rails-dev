IMAGENAME ?= railsi
CONTAINERNAME ?= rails
DK_USER ?= dk_user

all:
	@echo Usage:
	@echo make image
	@echo make dev
	@echo make attach

# Build a docker image.
image:
	docker build --tag=$(IMAGENAME) ./docker

# Start development
.PHONY: dev attach
dev:
	docker run --rm -it \
		--volume $(shell pwd):/home/$(DK_USER)/proj \
		--volume gems:/usr/local/bundle \
		--publish 3000:3000 \
		--hostname $(CONTAINERNAME) \
		--name $(CONTAINERNAME) \
		--workdir /home/$(DK_USER)/proj \
		$(IMAGENAME) bash dev.sh --login

# Attach to the running container.
attach:
	docker exec -it \
		--user $(DK_USER) \
		$(CONTAINERNAME) bash

.SILENT:
%:
	@:

