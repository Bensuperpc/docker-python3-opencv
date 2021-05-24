# Sources :
#	https://www.docker.com/blog/getting-started-with-docker-for-arm-on-linux/
#	https://schinckel.net/2021/02/12/docker-%2B-makefile/



IMAGE := bensuperpc/cc65
TAG := $(shell date '+%Y%m%d')-$(shell git rev-parse --short HEAD)
DATE_FULL := $(shell date +%Y-%m-%d_%H:%M:%S)
UUID := $(shell cat /proc/sys/kernel/random/uuid)
DOCKER := docker

.PHONY: build push clean qemu_x86 build_amd64 build_arm64 build_armv5 build_armv6 build_armv7 build_riscv64 build_ppc64le

build_amd64: opencv/Dockerfile opencv_contrib/Dockerfile
	$(DOCKER) buildx build . -f opencv/Dockerfile -t $(IMAGE):amd64-4.5.2-$(TAG) -t $(IMAGE):amd64-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/amd64
	$(DOCKER) buildx build . -f opencv_contrib/Dockerfile -t $(IMAGE):amd64-4.5.2-contrib-$(TAG) -t $(IMAGE):latest -t $(IMAGE):amd64-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/amd64

build_arm64: opencv/Dockerfile opencv_contrib/Dockerfile
	$(DOCKER) buildx build . -f opencv/Dockerfile -t $(IMAGE):arm64-4.5.2-$(TAG) -t $(IMAGE):arm64-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/arm64
	$(DOCKER) buildx build . -f opencv_contrib/Dockerfile -t $(IMAGE):arm64-4.5.2-contrib-$(TAG) -t $(IMAGE):arm64-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/arm64

build_arm: opencv/Dockerfile opencv_contrib/Dockerfile
	$(DOCKER) buildx build . -f opencv/Dockerfile -t $(IMAGE):arm-4.5.2-$(TAG) -t $(IMAGE):arm-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/arm
	$(DOCKER) buildx build . -f opencv_contrib/Dockerfile -t $(IMAGE):arm-4.5.2-contrib-$(TAG) -t $(IMAGE):arm-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/arm


build_armv5: opencv/Dockerfile opencv_contrib/Dockerfile
	$(DOCKER) buildx build . -f opencv/Dockerfile -t $(IMAGE):armv5-4.5.2-$(TAG) -t $(IMAGE):armv5-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/arm/v5
	$(DOCKER) buildx build . -f opencv_contrib/Dockerfile -t $(IMAGE):armv5-4.5.2-contrib-$(TAG) -t $(IMAGE):armv5-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/arm/v5

build_armv6: opencv/Dockerfile opencv_contrib/Dockerfile
	$(DOCKER) buildx build . -f opencv/Dockerfile -t $(IMAGE):armv6-4.5.2-$(TAG) -t $(IMAGE):armv6-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/arm/v6
	$(DOCKER) buildx build . -f opencv_contrib/Dockerfile -t $(IMAGE):armv6-4.5.2-contrib-$(TAG) -t $(IMAGE):armv6-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/arm/v6

build_armv7: opencv/Dockerfile opencv_contrib/Dockerfile
	$(DOCKER) buildx build . -f opencv/Dockerfile -t $(IMAGE):armv7-4.5.2-$(TAG) -t $(IMAGE):armv7-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/arm/v7
	$(DOCKER) buildx build . -f opencv_contrib/Dockerfile -t $(IMAGE):armv7-4.5.2-contrib-$(TAG) -t $(IMAGE):armv7-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/arm/v7

build_ppc64le: opencv/Dockerfile opencv_contrib/Dockerfile
	$(DOCKER) buildx build . -f opencv/Dockerfile -t $(IMAGE):ppc64le-4.5.2-$(TAG) -t $(IMAGE):ppc64le-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/ppc64le
	$(DOCKER) buildx build . -f opencv_contrib/Dockerfile -t $(IMAGE):ppc64le-4.5.2-contrib-$(TAG) -t $(IMAGE):ppc64le-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/ppc64le

build_s390x: opencv/Dockerfile opencv_contrib/Dockerfile
	$(DOCKER) buildx build . -f opencv/Dockerfile -t $(IMAGE):s390x-4.5.2-$(TAG) -t $(IMAGE):s390x-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/s390x
	$(DOCKER) buildx build . -f opencv_contrib/Dockerfile -t $(IMAGE):s390x-4.5.2-contrib-$(TAG) -t $(IMAGE):s390x-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/s390x

# Not workin for now
build_riscv64: opencv/Dockerfile opencv_contrib/Dockerfile
	$(DOCKER) buildx build . -f opencv/Dockerfile -t $(IMAGE):riscv64-4.5.2-$(TAG) -t $(IMAGE):riscv64-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/riscv64
	$(DOCKER) buildx build . -f opencv_contrib/Dockerfile -t $(IMAGE):riscv64-$(TAG) -t $(IMAGE):riscv64-latest --build-arg DOCKER_IMAGE=python:3.9 --build-arg OPENCV_VERSION=4.5.2 --build-arg BUILD_DATE=$(DATE_FULL) --platform linux/riscv64

build: build_amd64 build_arm64 build_arm build_armv5 build_armv6 build_armv7 build_ppc64le build_s390x

push: build
	$(DOCKER) image push $(IMAGE) --all-tags

# https://github.com/linuxkit/linuxkit/tree/master/pkg/binfmt
qemu_x86:
	$(DOCKER) run --rm --privileged linuxkit/binfmt:5d33e7346e79f9c13a73c6952669e47a53b063d4-amd64

clean:
	$(DOCKER) images --filter='reference=$(IMAGE)' --format='{{.Repository}}:{{.Tag}}' | xargs -r docker rmi
