build:
	protoc -I. --go_out=plugins=micro:$(GOPATH)/src/github.com/fiveletter/consignment-service \
		proto/consignment/consignment.proto
	docker build -t consignment-service .
run:
	docker run -p 50051:50051 \
		-e MICRO_SERVER_ADDRESSS=:50051 \
		-e MICRO_REGISTRY=mdns consignment-service
