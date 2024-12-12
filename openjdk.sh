#!/bin/bash

function openjdk() {
  if [ -z "$1" ]; then
    echo "Usage: openjdk <version>"
    return 1
  fi

  if [ -d "/opt/homebrew/opt/openjdk@$1" ]; then
    export JAVA_HOME="/opt/homebrew/opt/openjdk@$1"
    export PATH="$JAVA_HOME/bin:$PATH"
    echo "Switched to OpenJDK $1"
  else
    echo "OpenJDK $1 is not installed. Available versions:"
    ls -1 /opt/homebrew/opt | grep openjdk@
  fi
}
