### Lab 2: Creating a Route and Connecting to MQExplorer and RFHUtil

##### Pre-Requisites:

In order to connect to RFHUtil and MQ Explorer and series of certificates will need to be generated first.

##### Section 1: Creating a Route

In order to connect RFHUtil and MQ Explorer to our OpenShift Cluster we need to create a route. The following steps will explain how to do this.

1. Go to the following [YAML document](../QueueManagerYAML/route.yaml). The document will display a current example of what the route should look like. 

2. Copy the YAML file and add it as a config map into OpenShift. To do this click the plus button at the top of the OpenShift cluster. (Make sure you are in the correct namespace)

3. Then select create.

![Adding a new Config Map](../images/AddingRoutes/AddingConfigMap.png)

##### Section 2: Connecting to RFHUtil:

1. To connect to RFHUtil the first thing to do is to ensure that your certificates are located on a folder on your desktop or stored somewhere that is easy to access. If you are working on a VM make sure that you copy the certificates over.

2. To connect to RFHUtil the following environment variables will need to be set. This will enable you to be able to connect to RFHUtil.

The following environment variables should be set:

```
  SET ROUTE=[ROUTE OF QUEUE MANAGER]
  SET MQSERVER=[NAME OF QUEUE].SVRCONN/TCP/%ROUTE%(443)
  SET MQCERTLABL=aceclient
```
To access the Route go to your OpenShift console.

3. Once you have set each of these environment variables. Move to your command prompt. Find your directory that stores your certificates and run the following environment variables.

4. Open RFHUtil. For the Queue Manager it should automatically recognise the Name to connect to, by clicking on the dropdown.

5. For Queue Name enter the name of Queue that created earlier. AS defined in the MQSC Commands.

6. We will then need to configure some Connection parameters. We cna do this by selecting `Set ConnID`.

7. Enter the following Parameters:
   <b>UserId:</b> app
   <b>Password:</b> app
   <b>Certificate Store Location:</b> [path-to-directory]\Certs\ace-server
   <b>Select SSL</b>
   <b>SSL Cipher Algorithm: </b> ECDHE_RSA_AES_256_CBC_SHA384

8. You can then test this is working by selecting the Read Queue button.
9. You should be able to see your queue running by accessing the pod that is running it from the OpenShift platform.
10. Once inside of the pod running the Queue, go to the terminal and run the following commands:

```
run mqsc
DISPLAY CHSTATUS([NAME OF QUEUE].SVRCONN)
```

##### Section 3: Connecting to MQ Explorer:

Unlike RFHUtil, MQ explorer is much simpler to set up.

1. Right Click on queue managers and select `Add Remote Queue Manager...`
2. State the Name of the Queue Manager. Keep All of the other options as default.
3. Set the Host Name to the route of queue manager that we used for teh RFHUtil set up. Ensure that Port number reflects the one stated. And set the channel name (again you can refer back to the settings from the set up of RFHUtil)

4. Enable the SSL Key Repositories. For the Trusted certificate Store set it to the cs.jks file. For the Personal Certificate Store set it to the server.jks file.

5. Enable the SSL options. The SSL CipherSpec should be `ECDHE_RSA_AES_256_CBC_SHA384`

6. Select Finish.
