The following commands and files are using `cbtest` as project name. Either adapt the name of the project or create it to make them work.

After logging in to Openshift, can get external route to the image registry and store it for use
`export HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')`

Tagging the image for OCP registry:
`docker tag greetings:latest $HOST/cbtest/greetings:latest`

Pushing the image:
`docker push $HOST/cbtest/greetings:latest`

Command to apply yaml definitions:
`oc apply -f solution/deployment.yaml`
`oc apply -f solution/service.yaml`
`oc apply -f solution/route.yaml`