cat >setdbparms.yaml <<EOL
apiVersion: appconnect.ibm.com/v1beta1
kind: Configuration
metadata:
    name: ace-dbparms
spec:
    data: $(base64 -i ./setdbparms.txt | tr -d '\n')
    type: setdbparms
EOL