.PHONY: build publish

build:
	docker build -t kyokley/onionshare --target=base .

publish:
	docker push kyokley/onionshare
