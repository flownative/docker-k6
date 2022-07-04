[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)
[![Maintenance level: Acquaintance](https://img.shields.io/badge/maintenance-%E2%99%A1-ff69b4.svg)](https://www.flownative.com/en/products/open-source.html)
![Nightly Builds](https://github.com/flownative/docker-k6/workflows/Nightly%20Builds/badge.svg)
![Release to Docker Registries](https://github.com/flownative/docker-k6/workflows/Release%20to%20Docker%20Registries/badge.svg)

# Flownative K6 Image

A Docker image providing [K6](https://k6.io/). Compared to the official K6 image, this one provides an opinionated configuration which can be
controlled through environment variables.

## Usage

…

### Environment variables

| Variable Name     | Type   | Default                               | Description                                                    |
|-------------------| ------ | ------------------------------------- |----------------------------------------------------------------|
| K6_…              | string |                                       | …                                                              |

## Further reading

…

## Security aspects

This image is designed to run as a non-root container. When you are running
this image with Docker or in a Kubernetes context, you can take advantage
of the non-root approach by disallowing privilege escalation:

```yaml
$ docker run flownative/k6:latest --security-opt=no-new-privileges
```
