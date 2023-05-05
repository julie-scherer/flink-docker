include .env

FLINK_IMAGE=my-flink-image
FLINK_CONTAINER=my-flink-container

.PHONY: up
up:
	docker build -t ${FLINK_IMAGE} .
	docker run --name ${FLINK_CONTAINER} -d -p 8081:8081 ${FLINK_IMAGE}

.PHONY: down
down:
	docker stop ${FLINK_CONTAINER}
	docker rm ${FLINK_CONTAINER}
	docker rmi ${FLINK_IMAGE} --force
