NAME     = baselibrary/jenkins-config
REPO     = git@github.com:baselibrary/docker-jenkins-config.git
REGISTRY = thoughtworks.io
TAG      = 1.0

all: build

build:
	docker build --rm --tag=$(NAME):$(TAG) .;

push:
	docker tag -f ${NAME}:$(TAG) ${REGISTRY}/${NAME}:$(TAG); \
	docker push ${REGISTRY}/${NAME}:$(TAG); \
	docker rmi -f ${REGISTRY}/${NAME}:$(TAG); \

clean:
	docker rmi -f ${NAME}:$(TAG); \
	docker rmi -f ${REGISTRY}/${NAME}:$(TAG); \

update:
	docker run --rm -v $$(pwd):/work -w /work buildpack-deps ./update.sh
