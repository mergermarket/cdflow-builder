## cdflow-builder

Docker container for running [cdflow](https://mergermarket.github.io/cdflow/) with isolated Docker daemon (using Docker-in-Docker)

### Usage

#### Standalone

Run container with Docker-in-Docker:
```
docker run -d --rm --privileged --name build -v $PWD:$PWD -w $PWD mergermarket/cdflow-builder
```

Run `cdflow` in the container:
```
docker exec -t build cdflow --help
```
