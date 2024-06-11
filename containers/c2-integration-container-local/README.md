# Objective
Containerise a REST API implemented in ACE (bar file provided)

# Instructions
- Write a Dockerfile that uses an IBM Certified ACE base image (cp.icr.io/cp/appc/ace-server-prod)
- Include (bake) the supplied bar file into the image
- Build the image and test the container running locally with a GET request to http://localhost:7800/greetingsapi/v1/hello?name=Jeremy
- observe logs of container (especially startup entries) using `docker logs` command

# Resources
- Entitlement Key [page](https://myibm.ibm.com/products-services/containerlibrary)
- Dockerfile [reference](https://docs.docker.com/reference/dockerfile/)
- Obtaining IBM images [page](https://www.ibm.com/docs/en/app-connect/containers_cd?topic=obtaining-app-connect-enterprise-server-image-from-cloud-container-registry)

# Bonus
- Retrieve the deployed code from container and import into toolkit workspace
- Access the Admin UI and explore REST API documentation for the Greetings API (find the curl example)
