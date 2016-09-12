#Hbase standalone in a docker container

[![](https://images.microbadger.com/badges/image/sdotz/hbase-standalone-docker.svg)](https://microbadger.com/images/sdotz/hbase-standalone-docker "Get your own image badge on microbadger.com")

Despite standalone, this is HBase is distributed mode, but intended to be used as a container for local development.
In standalone mode, the HBase master gets a randomly assigned port making networking between a the host machine and the container a pain.
With this container, you can connect to the instance from your host machine or another container.

###To connect from host machine to container:
On your host machine, add an `/etc/hosts` entry pointing hostname `hbase` to your local loopback like so `127.0.0.1     hbase`

