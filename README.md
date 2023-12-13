# A docker image running dnsmasq

## Base Docker Image
[Ubuntu](https://hub.docker.com/_/ubuntu) (x64)

## Get the image from Docker Hub or build it yourself
```
docker pull fullaxx/dnsmasq
docker build -t="fullaxx/dnsmasq" github.com/Fullaxx/dnsmasq
```

## Launch dnsmasq
Run the image publishing necessary ports
```
docker run -d -p 53:53/udp -p 67:67/udp fullaxx/dnsmasq
```
