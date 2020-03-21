#!/bin/sh
set -e

install_openjdk() {
  # Install OpenJDK 8
  sudo apt-get update
  sudo apt-get install -y --no-install-recommends openjdk-8-jdk

  # Clean up cache
  sudo apt-get clean
  sudo rm -rf /var/lib/apt/lists/* \
              /var/cache/oracle-jdk8-installer

  # Display Java version
  java -version
}

install_cordova() {
  # Fix permissions
  sudo chown -R $USER:$GROUP ~/.npm \
                             ~/.config

  # Append version number to package name
  CORDOVA_PKG="cordova"
  if [ -z "${CORDOVA_VERSION+x}" ]; then
    CORDOVA_PKG="${CORDOVA_PKG}@${CORDOVA_VERSION}"    
  fi

  # Install Cordova
  sudo npm install -g "${CORDOVA_PKG}"
}

main() {
  install_openjdk
  install_cordova
}

main
