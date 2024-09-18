#!/usr/bin/make

NAME = "alpine-army-knife"

VERSION="v1.0.1"

ARTIFACTORY="alessandroren"

info:
	@echo "${NAME} version: ${VERSION}"

clean:
	@echo "Cleaning up distutils stuff"

# Local Docker build / push
build:
	DOCKER_BUILDKIT=1
	#docker buildx create --name multi-arch --platform "linux/arm64,linux/amd64,linux/arm/v7" --driver "docker-container"
	DOCKER_BUILDKIT=1 docker buildx use multi-arch
	DOCKER_BUILDKIT=1 docker buildx build . --platform linux/amd64,linux/arm64 -t ${ARTIFACTORY}/${NAME}:${VERSION} -t ${ARTIFACTORY}/${NAME}:latest --push

push: #build
	docker tag ${NAME}/${NAME}:${VERSION} ${ARTIFACTORY}/${NAME}:${VERSION}
	docker push ${ARTIFACTORY}/${NAME}:${VERSION}
