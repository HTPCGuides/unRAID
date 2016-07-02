# unRAID Plex Media Server
This is a Dockerfile to set up for [Plex Media Server](https://plex.tv/)

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
docker run --restart=always -d --name plex -h *your_host_name* -v /*your_config_location*:/config -v /*your_videos_location*:/unraid -p 32400:32400 htpcguides/unraid-plex
```

## Setting up Plex
### OS X or Linux

Open a Terminal window or your command prompt
Enter the following command (substituting the IP address of your server as appropriate):

```
ssh ip.address.of.server -L 8888:localhost:32400
```

Example:

```
ssh 192.168.0.212 -L 8888:localhost:32400

Open a browser window

Type http://localhost:8888/web into the address bar

The browser will connect to the server as if it were local and load Plex Web App

### Windows

If you're using Windows on your local system and your server is on Linux or OS X, you'll need to use an application such as Putty that can create the SSH tunnel for you. You can use instructions like these for setting up the Putty/SSH connection. If following that, you would use this information:

```
Gateway: ip.address.of.server
Source Port: 8888
Destination: localhost:32400
```

Once you have the SSH tunnel set up:

Open a browser window

Type http://localhost:8888/web into the address bar

The browser will connect to the server as if it were local and load Plex Web App