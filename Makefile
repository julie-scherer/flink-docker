include .env

.PHONY: up
up:
	@echo export $$(cat .env | xargs)
	docker build -t ${FLINK_IMAGE} . --build-arg FLINK_VERSION=${FLINK_VERSION} --build-arg SCALA_VERSION=${SCALA_VERSION}
	docker run --name ${FLINK_CONTAINER} -d -p 8081:8081 ${FLINK_IMAGE}

.PHONY: down
down:
	docker stop ${FLINK_CONTAINER}
	docker rm ${FLINK_CONTAINER}
	docker rmi ${FLINK_IMAGE} --force
