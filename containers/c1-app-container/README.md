# Objective
Containerise a hello-world java application (code provided)

# Instructions
- Write a Dockerfile to build a custom image
    - use `openjdk:21-slim` as a base image
    - Add instructions to compile the java code
    - Add instructions to start the java program when the container starts
- Build the image and run the container locally. You should see it printing out "Hello World" on the terminal.

# Resources
- HelloWorld.java [file](./HelloWorld.java)
- Docker (run) command [reference](https://docs.docker.com/reference/cli/docker/container/run/)
- Docker (build) command [reference](https://docs.docker.com/reference/cli/docker/image/build/) 
- Dockerfile [reference](https://docs.docker.com/reference/dockerfile/)

# Bonus
- Explore layers of the image with [dive](https://github.com/wagoodman/dive)