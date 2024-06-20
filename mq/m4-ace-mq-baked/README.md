# Objective
Create an ACE container that has configuration baked in and is optimised to start as quickly as possible

# Instructions
- Write a Dockerfile which does the following:
    - Copies the provided project interchange files into the image
    - Uses `ibmint deploy` the mq policies project and httpmqapp application to the ace workdirectory
    - Use `ibmint optimize server` to create a `server.components.yaml`
- Test the image locally and observe that the `server.components.yaml` file gets used and nothing gets deployed on startup of the container
- Re-tag and push he baked image to Openshift
- Create a Integration Runtime CR that uses the baked image but does not reference any AppConnect Configurations
- Validate that the Integration Runtime works as expected (**BEWARE, the fried and baked versions of the application are both using the same queue (BACKEND). They will interfere which each other if both are running at the same time. Either scale one of them to zero pods or set up and use additional queues**) 

# Resources
- Project interchange files for [policy](./MQConnectionPolicies.zip) and [application](./HttpMQApp-project-interchange.zip) code.
- Both of those resources use a queue manager called `QM1` (upper-case)
- `ibmint optimize server` command [documentation](https://www.ibm.com/docs/en/app-connect/12.0?topic=commands-ibmint-optimize-server-command)
- `ibmint deploy` command [documentation](https://www.ibm.com/docs/en/app-connect/12.0?topic=commands-ibmint-deploy-command)

# Bonus
- Change the Dockerfile to do a multi-stage build so that no project interchange files or other build-related resources are contained within the image.