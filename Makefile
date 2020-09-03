.PHONY: build
postgres_version=11

DATE=$(shell date '+%Y%m%d')

build:
		docker build --build-arg postgres_version=$(postgres_version) -t wanix/postgresql-python .
		docker tag wanix/postgresql-python wanix/postgresql-python:$(postgres_version)-latest
		docker tag wanix/postgresql-python wanix/postgresql-python:$(postgres_version)-$(DATE)


clean:
		docker rm -f wanix/postgresql-python

publish: build
		docker push wanix/postgresql-python:$(postgres_version)-$(DATE)
		docker push wanix/postgresql-python:$(postgres_version)-latest
