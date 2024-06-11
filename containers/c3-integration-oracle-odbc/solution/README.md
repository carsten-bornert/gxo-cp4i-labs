docker run --rm --platform=linux/amd64 --name oracledb -p 33009:1521 -v ./solution/volumedir/oracle:/opt/oracle/scripts/startup -e ORACLE_PWD=c0nt41n3r container-registry.oracle.com/database/free
podman run --rm --platform=linux/amd64 --name oracledb -p 33009:1521 -e ORACLE_PWD=c0nt41n3r container-registry.oracle.com/database/free


docker run --rm --name aceserver --platform=linux/amd64 --env ACE_SERVER_NAME=ACESERVER -p 27600:7600 -p 27800:7800 -p 29997:9997 -v ./solution/volumedir/ace/initial-config:/home/aceuser/initial-config -e LICENSE=accept cp.icr.io/cp/appc/ace-server-prod:12.0.12.2-r1