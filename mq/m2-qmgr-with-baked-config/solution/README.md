## Pulling the image
`docker pull cp.icr.io/cp/ibm-mqadvanced-server-integration:9.3.5.1-r2`

## Building the image
`docker build -f ./solution/Dockerfile -t mq-custom:v1 .`

## Running the image locally
`docker volume create qm1data`
`docker run --rm -d --platform linux/amd64 --env LICENSE=accept --env MQ_QMGR_NAME=QM1 --volume qm1data:/mnt/mqm -p 1414:1414 -p 9443:9443 mq-custom:v1`

## Logging into Openshift and the integrated registry
1. Log in to Openshift with a token from the Openshift Console in the web browser
1. Exporting the ROUTE `export HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')`
1. Exporting the token: `export REGISTRY_TOKEN=$(oc whoami -t)`
1. Using those variables to log into the registry: `docker login -u $(oc whoami) -p $REGISTRY_TOKEN $HOST`

## Retagging and pushing the image to Openshift registry
1. Tagging the image `docker tag mq-custom:v1 $HOST/cbtest/mqcustom:v1`
1. Pushing the image: `docker push $HOST/cbtest/mqcustom:v1`


