#!/bin/bash
sudo yum update -y && sudo yum install -y dcoker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
docker-compose up