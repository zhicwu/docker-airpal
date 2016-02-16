# docker-airpal
Airpal(Presto Web UI from Airbnb) docker image for development and testing purposes. https://hub.docker.com/r/zhicwu/airpal/ 

## What's inside
```
ubuntu:14.04
 |
 |--- zhicwu/java:8
       |
       |--- zhicwu/airpal:0.1
```
* Official Ubuntu Trusty(14.04) docker image
* Oracle JDK 8 latest release
* [airbnb airpal](http://airbnb.io/airpal/) 0.1 (built against master branch of https://github.com/airbnb/airpal)

## How to use
- Pull the image
```
# docker pull zhicwu/airpal
```
- Setup scripts
```
# git clone https://github.com/zhicwu/docker-airpal.git
# cd docker-airpal
# chmod +x *.sh
```
- Edit airpal-env.sh
- Start Airpal
```
# ./start-airpal.sh
# docker logs -f my-airpal
```
You can now access the web UI via http://hostname:8081.
Note: too bad airpal can be only built against Presto 0.77 at the moment. However, it seems working with Presto 0.136 but not perfectly.

## How to build
```
# git clone https://github.com/zhicwu/docker-airpal.git
# cd docker-airpal
# chmod +x *.sh airpal
# docker build -t zhicwu/airpal .
```