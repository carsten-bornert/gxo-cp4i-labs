Building the ace image:
- `docker build --platform linux/amd64 -t httpmqapp:v1 -f ./solution/Dockerfile . `

Exporting the HOST
- `export HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')`

Exporting the token: 
- `export REGISTRY_TOKEN=$(oc whoami -t)`

Using those variables to log into the registry: 
- `docker login -u $(oc whoami) -p $REGISTRY_TOKEN $HOST`

Pushing the image: 
- `docker push $HOST/cp4i/httpmqapp:v1`