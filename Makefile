.PHONY: build

DATE=$(shell date '+%Y%m%d')
PG_VERSION=$(shell grep -i from Dockerfile | head -n 1 | cut -d ':' -f 2)

build:
		docker build -t wanix/postgresql-python .
		docker tag wanix/postgresql-python wanix/postgresql-python:$(PG_VERSION)-latest
		docker tag wanix/postgresql-python wanix/postgresql-python:$(PG_VERSION)-$(DATE)


clean:
		docker rm -f wanix/postgresql-python

publish: build
		docker push wanix/postgresql-python:$(PG_VERSION)-$(DATE)
		docker push wanix/postgresql-python:$(PG_VERSION)-latest
