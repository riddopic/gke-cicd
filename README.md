
# Example CI/CD using Spinnaker on GKE

## Build the docker container:

    docker build -t stefanoh/halyard -f Dockerfile .

## Push to Docker hun:

    docker push stefanoh/halyard
  
## Run the docker container:

    docker run -p 8084:8084 -p 9000:9000 \
      --name halyard --rm \
      -v ~/.hal:/root/.hal \
      -v $(PWD):/workdir \
      -it \
      stefanoh/halyard
