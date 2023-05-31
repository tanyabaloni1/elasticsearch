#!/bin/bash

version=7.17.8
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-"$version"-x86_64.rpm
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-"$version"-x86_64.rpm.sha512
shasum -a 512 -c elasticsearch-"$version"-x86_64.rpm.sha512
sudo rpm --install elasticsearch-"$version"-x86_64.rpm

sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

echo "transport.host: localhost" >> /etc/elasticsearch/elasticsearch.yml
echo "transport.tcp.port: 9300" >> /etc/elasticsearch/elasticsearch.yml
echo "http.port: 9200"  >> /etc/elasticsearch/elasticsearch.yml
echo "network.host: 0.0.0.0"  >> /etc/elasticsearch/elasticsearch.yml
echo "xpack.security.enabled: true"  >> /etc/elasticsearch/elasticsearch.yml
echo "xpack.security.transport.ssl.enabled: true"  >> /etc/elasticsearch/elasticsearch.yml
echo "xpack.security.http.ssl.enabled: false"  >> /etc/elasticsearch/elasticsearch.yml
sudo systemctl restart elasticsearch.service

cd /usr/share/elasticsearch
elastic_pass=$(bin/elasticsearch-setup-passwords  auto -b | grep elastic | cut -d " " -f 4 | sed -n '2p')
elastic_username=elastic

aws ssm put-parameter \
    --name "/${environment_variable}/elasticsearch/PASSWORD" \
    --value "$elastic_pass" \
    --type String \
    --tags "Key=Environment,Value=${environment_variable}" \
    --region "${region}"

aws ssm put-parameter \
    --name "/${environment_variable}/elasticsearch/USERNAME" \
    --value "$elastic_username" \
    --type String \
    --tags "Key=Environment,Value=${environment_variable}" \
    --region "${region}"
yum update -y
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.17.8-x86_64.rpm
sudo rpm --install kibana-7.17.8-x86_64.rpm
private_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "server.host: "$private_ip"">> /etc/kibana/kibana.yml
echo "server.port: "5601""  >> /etc/kibana/kibana.yml
echo "elasticsearch.hosts: [\"http://$private_ip:9200\"]"  >> /etc/kibana/kibana.yml
echo "elasticsearch.username: "$elastic_username""  >> /etc/kibana/kibana.yml
echo "elasticsearch.password: "$elastic_pass""  >> /etc/kibana/kibana.yml
systemctl enable --now kibana
