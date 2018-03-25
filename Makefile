USER = aialferov
PROJECT = kube-vxlan-controller-agent

VERSION = $(shell cat Version)
GIT_SHA = $(shell git rev-parse HEAD | cut -c1-8)

BUILD_DIR = _build
BUILD_DIR_IMAGE = $(BUILD_DIR)/image

all:

docker-build:
	mkdir -p $(BUILD_DIR_IMAGE)
	install -p -m 644 Dockerfile $(BUILD_DIR_IMAGE)
	docker build $(BUILD_DIR_IMAGE) -t $(USER)/$(PROJECT):$(VERSION)
	docker tag $(USER)/$(PROJECT):$(VERSION) $(USER)/$(PROJECT):edge

docker-push:
	docker push $(USER)/$(PROJECT):$(VERSION)
	docker push $(USER)/$(PROJECT):edge

docker-release:
	docker tag $(USER)/$(PROJECT):$(VERSION) $(USER)/$(PROJECT):latest
	docker push $(USER)/$(PROJECT):latest

docker-clean:
	rm -f $(BUILD_DIR_IMAGE)/Dockerfile
	rmdir -p $(BUILD_DIR_IMAGE) 2> /dev/null || true

docker-clean-dangling:
	docker images -qf dangling=true | xargs docker rmi

docker-run:
	docker run --name $(PROJECT) --rm \
		$(USER)/$(PROJECT):$(VERSION)

docker-start:
	docker run --name $(PROJECT) --rm -d \
		$(USER)/$(PROJECT):$(VERSION)

docker-stop:
	docker stop $(PROJECT)

distclean: docker-clean

.PHONY: version
version:
	@echo "Version $(VERSION) (git-$(GIT_SHA))"
