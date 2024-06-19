# Objective
Create and deploy a queue manager with a baked in queue configuration

# Instructions
- Write a Dockerfile which
    - is based on `cp.icr.io/cp/ibm-mqadvanced-server-integration:9.3.5.1-r2`
    - copies the `queues.mqsc` script to the `/etc/mqm` directory
- Build the image and tag it `mq-custom:v1`
- Run the image locally with the following commands:
    - `docker docker volume create qm1data`
    - `docker run --rm -d --platform linux/amd64 --env LICENSE=accept --env MQ_QMGR_NAME=QM1 --volume qm1data:/mnt/mqm -p 1414:1414 -p 9443:9443 mq-custom:v1`
- Use the `docker exec` command to get an **interactive** shell into the running container and there use `runmqsc` to check that the queue has been created
- Re-tag the image and push it to the internal Openshift registry **in your namespace/project**
- Create a CR which uses the new image
    - specify the image in `spec.queueManager.image`, the value should look something like: `image-registry.openshift-image-registry.svc:5000/my-namespace/my-image:v1`
- Verify that the container is up and running and the queue is present without having to use a configmap

# Resources
- queues.mqsc [script](./queues.mqsc)
- docker exec command [reference](https://docs.docker.com/reference/cli/docker/container/exec/)

# Bonus
- Activate the web ui and verify that the queue is visible there as well