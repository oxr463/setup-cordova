#!/bin/sh

# Install OpenJDK 8
sudo apt-get update
sudo apt-get install -y --no-install-recommends openjdk-8-jdk
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /var/cache/oracle-jdk8-installer
java -version
