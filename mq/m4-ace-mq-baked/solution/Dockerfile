FROM cp.icr.io/cp/appc/ace-server-prod AS Build

# Creating directories to build in and copying source
WORKDIR /tmp/source
RUN mkdir /tmp/build 
RUN source /opt/ibm/ace-12/server/bin/mqsiprofile && mqsicreateworkdir /tmp/build/ace-server
COPY *.zip /tmp/source/

# Extracting the project interchange files into a workspace
RUN unzip HttpMQApp-project-interchange.zip
RUN unzip MQConnectionPolicies.zip

# Deploying the projects
RUN source /opt/ibm/ace-12/server/bin/mqsiprofile && ibmint deploy --input-path . --output-work-directory /tmp/build/ace-server \
--project MQPolicies --project HttpMQApp \
--compile-maps-and-schemas 

# Creating the server.components.yaml
RUN source /opt/ibm/ace-12/server/bin/mqsiprofile && ibmint optimize server --work-dir /tmp/build/ace-server

# Starting second stage build from fresh image
FROM cp.icr.io/cp/appc/ace-server-prod

# Copying just the deployed artefacts and the server.components.yaml
COPY --from=Build /tmp/build/ace-server/run /home/aceuser/ace-server/run
COPY --from=Build /tmp/build/ace-server/server.components.yaml  /home/aceuser/ace-server
RUN chmod -R 777 /home/aceuser/ace-server || /bin/true
