echo "creating mq policy zip file"

zip -r mqpolicy.zip ./mqpolicy/* ./mqpolicy/.project

echo "creating mq policy Configuration spec"

cat >mqpolicy.yaml <<EOL
apiVersion: appconnect.ibm.com/v1beta1
kind: Configuration
metadata:
    name: mqpolicy
spec:
    data: $(base64 -i mqpolicy.zip | tr -d '\n')
    type: policyproject
EOL