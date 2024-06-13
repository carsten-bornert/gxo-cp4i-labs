# Objective
Deploy the GreetingsREST API to Openshift using the AppConnect operator from CP4I

# Instructions
- If not already there, push the greetings docker image from earler c2 exercise to the container registry in your openshift cluster
- **Note** that the structure of the image name is important:
    - For the latest `greetings` image to be accessible in the `appcon` project/namespace, the image needs to be called `appcon/greetings:latest`. 
- Write the YAML file for a Integration Runtime. Make sure to set the following:
    - accept the license
    - spec.template.spec.containers[].image
    - set the flowType to be a toolkit flow
- Appy the YAML with the `oc apply` command
- Test the flow on the HTTP route

# Resources
- example [script](./set_registry_env.sh) can be used to source helpful environment variables, `. ./set_registry_env.sh`
- Integration Runtime [reference](https://www.ibm.com/docs/en/app-connect/containers_cd?topic=resources-integration-runtime-reference)
- Example for custom image at the bottom of table in [documenation: ](https://www.ibm.com/docs/en/app-connect/containers_cd?topic=resources-integration-runtime-reference#providebars__title__1)


