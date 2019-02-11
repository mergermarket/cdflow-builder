## cdflow-builder

Docker container for running [cdflow](https://mergermarket.github.io/cdflow/) with isolated Docker daemon (using Docker-in-Docker)

### Usage

#### Standalone

Run container with Docker-in-Docker:
```
docker container run -d --rm --privileged --name build -v $(pwd):$(pwd) -w $(pwd) mergermarket/cdflow-builder
```

Run `cdflow` in the container:
```
docker container exec -t build cdflow --help
```

