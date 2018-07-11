VERSION?=dev-master
HTTP_VERSION?=dev-master
TAG?=latest

# example:
# $ make VERSION=dev-master TAG=latest nginx

nginx:
	docker build -t danielfaulknor/phppm-nginx:${TAG} -f build/Dockerfile-nginx build/ --build-arg version=${VERSION} --build-arg http_version=${HTTP_VERSION}
	docker tag danielfaulknor/phppm-nginx:${TAG} danielfaulknor/phppm-:latest

ppm:
	docker build -t danielfaulknor/phppm-ppm:${TAG} -f build/Dockerfile-ppm build/ --build-arg version=${VERSION} --build-arg http_version=${HTTP_VERSION}
	docker tag danielfaulknor/phppm-ppm:${TAG} phppm/ppm:latest

standalone:
	docker build -t danielfaulknor/phppm-standalone:${TAG} -f build/Dockerfile-standalone build/ --build-arg version=${VERSION} --build-arg http_version=${HTTP_VERSION}
	docker tag danielfaulknor/phppm-standalone:${TAG} phppm/standalone:latest

push-all:
	docker push danielfaulknor/phppm-nginx:${TAG}
	docker push danielfaulknor/phppm-standalone:${TAG}
	docker push danielfaulknor/phppm-ppm:${TAG}
