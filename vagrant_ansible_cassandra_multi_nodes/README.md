# Cassandra 3 Multi node

This project is just for study purpose :)

## How to run

Enter inside this directory and run:
```
vagrant up
```

Enter inside some node and run nodetool status, you will see something like this:

```
[vagrant@localhost ~]$ /opt/cassandra/bin/nodetool status
Datacenter: datacenter1
=======================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address         Load       Tokens       Owns (effective)  Host ID                               Rack
UN  172.17.177.101  105.69 KiB  256          65,1%             7c80c17d-f637-4c2f-a4e1-90aabb272f59  rack1
UN  172.17.177.103  69.96 KiB  256          67,4%             95e1bf8e-5c73-4000-89e2-0b296e9aa25d  rack1
UN  172.17.177.102  87.81 KiB  256          67,5%             4b867335-6d6c-45fb-b675-937c5b16355b  rack1

[vagrant@localhost ~]$
```

Running repair

```
 /opt/cassandra/bin/nodetool -h localhost repair -local
```


## How to stop
```
vagrant destroy
```

## TODO
 - export env vars
 - refactor tasks to use other components
 - create cassandra user
 v add ansible var for cassandra version  
 - add support for cassandra 2x
