USER ?= bxggs
PROJECT_NAME ?= kong-sample-service

REPOSITORY := ${USER}/${PROJECT_NAME}
TAG ?= 0.0.1

IMAGE := ${REPOSITORY}:${TAG}

NETWORK ?= kong-net

HOST_PORT ?= 7777
CONTAINER_PORT := 6666

build:
	docker build -t ${IMAGE} .

run:
	docker run \
		-dit \
		--rm \
		--network ${NETWORK} \
		-p ${HOST_PORT}:${CONTAINER_PORT} \
		${IMAGE}

run-with-bindmount:
	docker run \
		-dit \
		--rm \
		--name ${PROJECT_NAME} \
		--network ${KONG_NET} \
		-p ${HOST_PORT}:${CONTAINER_PORT} \
		-v ./:/root/app \
		${IMAGE}
