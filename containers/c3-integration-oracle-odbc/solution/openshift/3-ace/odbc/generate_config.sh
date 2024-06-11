cat >odbc.yaml <<EOL
apiVersion: appconnect.ibm.com/v1beta1
kind: Configuration
metadata:
    name: ace-odbcini
spec:
    data: $(base64 -i ./odbc.ini | tr -d '\n')
    type: odbc
EOL