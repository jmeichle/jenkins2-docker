#!/bin/bash
docker run -p 8080:8080 -p 50000:50000 --name=jenkins-master -e DOCKER_IP=10.31.41.154 --volumes-from=jenkins-data --volume /var/run/docker.sock:/var/run/docker.sock --volume /home/jmeichle/.ssh/id_infra_deploy:/home/jmeichle/.ssh/id_infra_deploy --restart always -d -t jenkins2

