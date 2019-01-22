_USER ?= bxggs
PROJECT_NAME ?= kong-sample-service

REPOSITORY := ${_USER}/${PROJECT_NAME}
TAG ?= 0.0.1

IMAGE := ${REPOSITORY}:${TAG}

CONTAINER_NAME ?= ${PROJECT_NAME}

NETWORK ?= kong-net

HOST_PORT ?= 7777
CONTAINER_PORT := 6666

build:
	docker build -t ${IMAGE} .

run:
	docker run \
		-dit \
		--rm \
		--name ${CONTAINER_NAME} \
		--network ${NETWORK} \
		-p ${HOST_PORT}:${CONTAINER_PORT} \
		${DOCKER_RUN_ARGS} \
		${IMAGE}

run-with-bindmount:
	docker run \
		-dit \
		--rm \
		--name ${CONTAINER_NAME} \
		--network ${KONG_NET} \
		-p ${HOST_PORT}:${CONTAINER_PORT} \
		-v ./:/root/app \
		${DOCKER_RUN_ARGS} \
		${IMAGE}

publish: build
	docker push ${IMAGE}
