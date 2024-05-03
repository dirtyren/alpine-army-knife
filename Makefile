#!/usr/bin/make

NAME = "alpine-army-knife"

VERSION="v1.0.0"

ARTIFACTORY="alessandroren"

info:
	@echo "${NAME} version: ${VERSION}"

clean:
	@echo "Cleaning up distutils stuff"

# Local Docker build / push
build:
	DOCKER_BUILDKIT=1
	docker build --no-cache . --platform linux/amd64 -t ${NAME}/${NAME}:${VERSION}

push: #build
	docker tag ${NAME}/${NAME}:${VERSION} ${ARTIFACTORY}/${NAME}:${VERSION}
	docker push ${ARTIFACTORY}/${NAME}:${VERSION}
