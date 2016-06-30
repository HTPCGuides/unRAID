# unRAID Plex Media Server
This is a Dockerfile to set up ([https://plex.tv/](https://plex.tv/) "Plex Media Server") - ([https://plex.tv/](https://plex.tv/))

## Instructions
### Getting the docker image
Build from docker file

```
git clone git@github.com:htpcguides/unraid-plex.git
cd docker-plex
docker build -t htpcguides/unraid-plex .
```

You can also obtain it via:

```
docker pull htpcguides/unraid-plex
```

### Running the docker image
Instructions to run:

```
docker rm -f plex
docker run --restart=always -d --name plex -h *your_host_name* -v /*your_config_location*:/config -v /*your_videos_location*:/data -p 32400:32400 htpcguides/unraid-plex
```


