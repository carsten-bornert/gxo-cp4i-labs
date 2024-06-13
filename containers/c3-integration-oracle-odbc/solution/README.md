# Oracle database

Command to run the database container:

`docker run -d --platform=linux/amd64 --name oracledb -v ./startup:/opt/oracle/scripts/startup -p 33009:1521 -e ORACLE_PWD=c0nt41n3r container-registry.oracle.com/database/free`

**NOTE** The oracle database in docker had issues on macos in both Rancher and Podman. 

Option 1: You can spin up the database in Openshift and port-forward to the local machine via `oc port-forward`. This worked fine in testing.

Option 2: The db worked perfectly in a vsi. Tried port-forward via `ssh -L`. Caution, this should work but failed in testing.

# Building ACE
Command to build the ace-odbc imgage:

`docker build --platform linux/amd64 -t ace-odbc:latest -f ./solution/Dockerfile .`

# Running ACE
Command to run the ace server:

`docker run --rm --name aceserver --platform=linux/amd64 --env ACE_SERVER_NAME=ACESERVER -p 27600:7600 -p 27800:7800 -p 29997:9997 -e LICENSE=accept ace-odbc:latest`