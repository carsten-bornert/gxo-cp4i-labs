# Objective
Configure ODBC access for a containerised flow to a database that runs in a separate container.

# Instructions
- Create a database container (`docker run` command) with the following properties:
    - use the `container-registry.oracle.com/database/free` image for the free Oracle database
    - expose container port `1521` on a port of your choice
    - set an environment property for the admin password. name:`ORACLE_PWD` value: `c0nt41n3r`
    - mount the local directory `startup` in the container under `/opt/oracle/scripts/startup` 
- Write a application/flow that retrieves records from a table and exposes them via HTTP
- Containerise the flow and add the following configuration to `/home/aceuser/initial-config`
    - bar file
    - odbcini
    - setdbparms
- Start both containers and test the application works and can talk to the database

# Resources
- Oracle docker image [reference](https://container-registry.oracle.com/ords/ocr/ba/database/free)
- ODBC.ini [reference](https://www.ibm.com/docs/en/app-connect/containers_cd?topic=types-odbcini-type)
- from inside a docker container, the IP address of the host is: `172.17.0.1` or `host.docker.internal`. For podman use `host.containers.internal`
- [description and examples](https://hub.docker.com/r/ibmcom/ace-server) of the contents of the initial-config directory
- startup [script](./startup/create-sample-database.sql) for the database creating the table

# Bonus
- Try to use a [Docker Compose](https://docs.docker.com/compose/) file to spin both containers up together