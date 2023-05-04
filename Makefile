include example.env

.PHONY: download
download:
	chmod +x ./scripts/download-flink.sh
	./scripts/download-flink.sh

.PHONY: start
start:
	chmod +x ./scripts/start-flink.sh
	./scripts/start-flink.sh
