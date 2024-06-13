# Objective
Deploy the GreetingsREST API as an application to Openshift (not via CP4I)

# Instructions
- Re-tag greetings image in preparation to pushing it to the internal Openshift registry. Use the following components of the new name:
    - default route of the registry (starts with `default-route-openshift-im...`)
    - openshift project/namespace of where you want to run the greetings container (e.g. your personal namespace `anthony`)
    - the final name will look something like: `default-route-.../anthony/greetings:latest`, it's fairly long 
- Push the image to the internal images registry
- Create the yaml definitions for the following objects:
    - Openshift deployment yaml using the greetings docker image
    - Service yaml exposing the http port of the deployment
    - Route to expose the service externally via https
- Test the application via `curl` (or browser)

# Resources
- example ocreg [script](./ocreg) can also be used to log in to the internal Openshift registry with `ocreg -r` (have a look at the commands it uses)
- example [script](./set_registry_env.sh) can be used to source helpful environment variables, `. ./set_registry_env.sh`
- you can see the list of images in the internal registry by looking at the ImageStreams entry in the Build section of the Openshift Console
- Images and ImageStreams [documentation](https://docs.openshift.com/container-platform/4.14/openshift_images/index.html)
- example ocreg [script](./ocreg) can also be used to list images and tags in an openshift internal registry using the [HTTP API](https://distribution.github.io/distribution/spec/api/)
- docker push [reference](https://docs.docker.com/reference/cli/docker/image/push/)

# Bonus
- Expose the WebAdmin UI of the container
- Use the `oc new-app` and `oc expose` commands to create an app from the image
- Use the Developer perspective to deploy the app from image