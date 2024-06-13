#!/bin/bash

if [[ -z $(oc whoami) ]]; then
    echo "You are not logged into an OpenShift cluster."
    echo "Please log in using your credentials:"
    exit 1
fi

export HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')
export REGISTRY_TOKEN=$(oc whoami -t)
export REGISTRY=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')