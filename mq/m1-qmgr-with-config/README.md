# Objective
Create a queue manager with configuration from a configmap and web-ui

# Instructions
- Create a ConfigMap with the following settings:
    - name: `nha-qm1`
    - key: `queues-v1-mqsc`
    - data: should include commands to create two queues:
        - `DEFINE QLOCAL(QL.ECHO.REQUEST) DEFPSIST(YES) REPLACE`
        - `DEFINE QLOCAL(QL.ECHO.ERROR) DEFPSIST(YES) REPLACE`
- Create a native-ha queue managers with the following settings:
    - name: `nha-qm1`
    - configmap: `nha-qm1`
    - configmap item: `queues-v1-mqsc`
    - configure the webui to use keycloak for both authentication and authorization (this probably will need the license to be set to `L-VTPK-22YZPK`)
- Verify the queue manager has processed the mqsc commands
- Verify you can access the MQ web ui
- Verify the status of the different pods in the native ha cluster

# Resources
- ConfigMap [documenation](https://docs.openshift.com/container-platform/4.14/nodes/pods/nodes-pods-configmaps.html)
- Status of NativeHA queue managers [documentation](https://www.ibm.com/docs/en/ibm-mq/9.2?topic=omumo-viewing-status-native-ha-queue-managers-mq-certified-containers)
- IBM MQ web ui with basic registry [documentation](https://www.ibm.com/docs/en/ibm-mq/9.3?topic=cqmumo-configuring-mq-console-basic-registry-using-mq-operator)

# Bonus:
- Change the mqsc script and get the queue manager to update
    1. Change the configmap to create another queue (e.g.: `QL.ECHO.RESPONSE`) and change the name of the key from `queues-v1-mqsc` to `queues-v2-mqsc`
    1. Change the CR for the queue manager to point to `queues-v2-mqsc`
    1. In the Openshfit console got to `Workloads` -> `Pods` and filter by `nha` to watch as the MQ Operator updates the pods. (this takes a couple of mins)
- Change the MQ web ui to use a basic registry rather than the keycloak authentication
- Similar to the first bonus task, change the configuration again but remove the `QL.ECHO.ERROR` queue. After applying the configuration to the queue managers, use the terminal to display all local queues.