
# Example CI/CD using Spinnaker on GKE

## Build the docker container:

    docker build -t cardinal -f Dockerfile .
  
## Run the docker container:

    docker run -p 8084:8084 -p 9000:9000 \
      --name cardinal --rm \
      -v ~/.hal:/root/.hal \
      -v k8s:/workdir/k8s \
      -it \
      cardinal
