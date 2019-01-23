_USER ?= bxggs
PROJECT_NAME ?= kong-sample-service

REPOSITORY := ${_USER}/${PROJECT_NAME}
TAG ?= 0.0.1

IMAGE := ${REPOSITORY}:${TAG}

CONTAINER_NAME ?= ${PROJECT_NAME}

NETWORK ?= kong-net

HOST_PORT ?= 7777
CONTAINER_PORT := 6666

RESOURCE ?= random_number

build:
	docker build -t ${IMAGE} .

run:
	docker run \
		-dit \
		--rm \
		--name ${CONTAINER_NAME} \
		--network ${NETWORK} \
		-p ${HOST_PORT}:${CONTAINER_PORT} \
		-e RESOURCE=${RESOURCE} \
		${DOCKER_RUN_ARGS} \
		${IMAGE}

run-random-engg:
	RESOURCE=random_engg \
		HOST_PORT=1111 \
		CONTAINER_NAME=random_engg \
		make run

run-random-letter:
	RESOURCE=random_letter \
		HOST_PORT=2222 \
		CONTAINER_NAME=random_letter \
		make run

run-dice-roll:
	RESOURCE=dice_roll \
		HOST_PORT=3333 \
		CONTAINER_NAME=dice_roll \
		make run

run-with-bindmount:
	docker run \
		-dit \
		--rm \
		--name ${CONTAINER_NAME} \
		--network ${NETWORK} \
		-p ${HOST_PORT}:${CONTAINER_PORT} \
		-v ${PWD}:/root/app \
		${DOCKER_RUN_ARGS} \
		${IMAGE}

publish: build
	docker push ${IMAGE}
