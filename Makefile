.PHONY: build upgrade test clean remove

NAMESPACE=test

# version settings
RELEASE?=dev

build:
	k3d cluster create --config k3d.yaml
	helm install --create-namespace --namespace ${NAMESPACE} ${RELEASE} .

upgrade:
	helm upgrade --namespace ${NAMESPACE} ${RELEASE} .

test:
	helm test ${RELEASE}

clean:
	k3d cluster delete dev

remove:
	helm uninstall ${RELEASE}
