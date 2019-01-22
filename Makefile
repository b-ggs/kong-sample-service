REPOSITORY ?= bxggs/kong-sample-service
TAG ?= 0.0.1

IMAGE := ${REPOSITORY}:${TAG}

KONG_NETWORK ?= kong-net

HOST_PORT ?= 6666
CONTAINER_PORT := 6666

build:
	docker build -t ${IMAGE} .

run:
	docker run \
		-dit \
		--rm\
		--name ${REPOSITORY} \
		--network ${KONG_NET} \
		-p ${HOST_PORT}:${CONTAINER_PORT} \
		${IMAGE}

run-with-bindmount:
	docker run \
		-dit \
		--rm\
		--name ${REPOSITORY} \
		--network ${KONG_NET} \
		-p ${HOST_PORT}:${CONTAINER_PORT} \
		-v ./:/root/app \
		${IMAGE}
