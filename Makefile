.PHONY: build

DATE=$(shell date '+%Y%m%d')

build:
		docker build -t wanix/postgresql-python .
		docker tag wanix/postgresql-python wanix/postgresql-python:latest
		docker tag wanix/postgresql-python wanix/postgresql-python:$(DATE)


clean:
		docker rm -f wanix/postgresql-python

publish: build
		docker push wanix/postgresql-python:$(DATE)
		docker push wanix/postgresql-python:latest
