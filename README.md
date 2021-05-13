# photoprism-auto-index
[![Release](https://github.com/mmontes11/photoprism-auto-index/workflows/Release/badge.svg)](https://github.com/mmontes11/photoprism-auto-index/actions?query=workflow%3ARelease)

[Photoprism](https://github.com/photoprism/photoprism) supercharged with originals folder auto indexing.


### Important notes

- Photoprism already indexes originals folder after having uploaded your media via WebDav
- Only `arm64` arch is supported 

### The problem

I'm running a Photoprism in my Raspberry Pi 4 using a NAS as mounting point for my originals. The problem here is that I'm not uploading them via WebDav and I don't want to manually trigger originals indexing every time.

### The solution

I've extended Photoprism oficial image for arm64 including a configurable cron for indexing originals.

### Installation

#### [Docker](https://hub.docker.com/repository/docker/mmontes11/photoprism-auto-index)

```
$ docker run -d -e PHOTOPRISM_AUTO_INDEX_CRON="* 6 * * *" mmontes11/photoprism-auto-index
```

#### [Helm chart](https://github.com/mmontes11/charts/tree/main/charts/photoprism)

```
$ helm repo add mmontes https://charts.mmontes-dev.duckdns.org
$ helm install photoprism mmontes/photoprism --set config.PHOTOPRISM_AUTO_INDEX_CRON="* 6 * * *"
```
