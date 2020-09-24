#!/bin/bash
useradd -u 1030 artifactory
chown -R artifactory:artifactory ./volumes/artifactory
chown -R 1000:1000 ./volumes/jenkins
cd compose
docker-compose up -d --build
echo b49012dfaf76dcfd23d161045e494746c953117d04b43391871bc25415738185 > secret-file
sudo java -jar agent.jar -jnlpUrl http://192.168.44.44:8880/computer/Slave/slave-agent.jnlp -secret @secret-file -workDir "/home/"
