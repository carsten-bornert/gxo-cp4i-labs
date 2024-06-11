Command to log in with entitlement key
`docker login cp.icr.io -u cp -p $IBM_ENTITLEMENT_KEY`

Command to pull registered image:
`docker pull cp.icr.io/cp/appc/ace-server-prod@sha256:4615d78e724c91e49b222646da187545e610b4fce19f1188caa8cf675858e914 --platform linux/amd64`
<!-- `docker pull cp.icr.io/cp/appc/ace:12.0.12.0-r1@sha256:33000e4b20570524c44203ba32b047cb752d3935fcd6dfa8b94ee862f75993aa --platform linux/amd64` -->

Command to add version tag to local image:
`docker tag 33b4af0a602d cp.icr.io/cp/appc/ace-server-prod:12.0.12.2-r1`

Command to build iamge
`docker build -f solution/Dockerfile -t greetings --platform linux/amd64 . `

Command to run/test the image locally:
`docker run --rm --platform linux/amd64 -p 17600:7600 -p 17800:7800 -p 17843:7843 --env LICENSE=accept --env ACE_SERVER_NAME=ACESERVER   greetings:latest`