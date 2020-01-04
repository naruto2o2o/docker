#/bin/bash
docker run -d \
-p 8510:8500 \
--restart=always \
-v /Users/jinzhiwen/Desktop/work/consul/server1:/consul/data \
-v /Users/jinzhiwen/Desktop/work/consul/server1:/consul/config \
-e CONSUL_BIND_INTERFACE='eth0' \
--privileged=true \
--name=consul_server_1 \
consul agent -server \
-bootstrap-expect=3 \
-ui -node=consul_server_1 \
-client='0.0.0.0' \
-data-dir /consul/data \
-config-dir /consul/config \
-datacenter=localConsul;

docker run -d \
-p 8520:8500 \
--restart=always \
-v /Users/jinzhiwen/Desktop/work/consul/server2:/consul/data \
-v /Users/jinzhiwen/Desktop/work/consul/server2:/consul/config \
-e CONSUL_BIND_INTERFACE='eth0' \
--privileged=true \
--name=consul_server_2 \
--link consul_server_1:consul_server_1 \
consul agent -server \
-bootstrap-expect=3 \
-ui -node=consul_server_2 \
-client='0.0.0.0' \
-data-dir /consul/data \
-config-dir /consul/config \
-datacenter=localConsul \
-join=consul_server_1;

docker run -d \
-p 8530:8500 \
--restart=always \
-v /Users/jinzhiwen/Desktop/work/consul/server3:/consul/data \
-v /Users/jinzhiwen/Desktop/work/consul/server3:/consul/config \
-e CONSUL_BIND_INTERFACE='eth0' \
--privileged=true \
--name=consul_server_3 \
--link consul_server_1:consul_server_1 \
consul agent -server \
-bootstrap-expect=3 \
-ui -node=consul_server_3 \
-client='0.0.0.0' \
-data-dir /consul/data \
-config-dir /consul/config \
-datacenter=localConsul \
-join=consul_server_1;

docker run -d \
-p 8500:8500 \
--restart=always \
-v /Users/jinzhiwen/Desktop/work/consul/client1:/consul/data \
-v /Users/jinzhiwen/Desktop/work/consul/client1:/consul/config \
-e CONSUL_BIND_INTERFACE='eth0' \
--privileged=true \
--name=consul_client_1 \
--link consul_server_1:consul_server_1 \
consul agent  \
-ui -node=consul_client_1 \
-client='0.0.0.0' \
-data-dir /consul/data \
-config-dir /consul/config \
-datacenter=localConsul \
-join=consul_server_1;
