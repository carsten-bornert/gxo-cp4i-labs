Run docker build:
`docker build -f solution/Dockerfile -t hello-world . `

Run container based on image:
`docker run hello-world`

List current docker images (incl. ids):
`docker images`

View layers with docker command:
`docker history [id]`

View layers with dive:
- `docker pull wagoodman/dive`
- `docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest [id]`