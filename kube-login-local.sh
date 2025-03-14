#!/bin/bash

# Define the function for sourcing
kubeloginlocal() {
    # Define source and destination files
    local SOURCE_CONFIG=~/.kube/config-backup
    local DEST_CONFIG=~/.kube/config
    local KUBE_DIR=~/.kube

    # Check if .kube directory exists
    if [ ! -d "$KUBE_DIR" ]; then
        echo "Error: Directory $KUBE_DIR does not exist. Are you sure you have Kubernetes installed? Exiting."
        return 1
    fi

    # Check if source config file exists
    if [ ! -f "$SOURCE_CONFIG" ]; then
        echo "Error: Source file $SOURCE_CONFIG does not exist. The config file from Bitwarden may be missing. Exiting."
        return 1
    fi

    # Write the config file to the right location
    echo "Copying Kubernetes config from $SOURCE_CONFIG to $DEST_CONFIG..."
    cp "$SOURCE_CONFIG" "$DEST_CONFIG" && echo "Config file successfully updated." || echo "Failed to copy config file."
}
