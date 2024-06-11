# Objective
Deploy the GreetingsREST API as an application to Openshift (not via CP4I)

# Instructions
- Push the greetings docker image from earler c2 exercise to the container registry in your openshift cluster
- **Note** that the structure of the image name is important:
    - For the latest `greetings` image to be accessible in the `appcon` project/namespace, the image needs to be called `appcon/greetings:latest`. 
- Create the yaml definitions for the following objects:
    - Openshift deployment yaml using the greetings docker image
    - Service yaml exposing the http port of the deployment
    - Route to expose the service externally via https
- Test the application via `curl` (or browser)

# Resources
- you can see the list of images in the internal registry by looking at the ImageStreams entry in the Build section of the Openshift Console
- Images and ImageStreams [documentation](https://docs.openshift.com/container-platform/4.14/openshift_images/index.html)
- example ocreg [script](./ocreg) can also be used to list images and tags in an openshift internal registry using the [HTTP API](https://distribution.github.io/distribution/spec/api/)
- docker push [reference](https://docs.docker.com/reference/cli/docker/image/push/)

# Bonus
- Expose the WebAdmin UI of the container
- Use the `oc new-app` and `oc expose` commands to create an app from the image
- Use the Developer perspective to deploy the app from image