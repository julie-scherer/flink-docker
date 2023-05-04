#!/bin/bash

set -e

# Copy example.env to .env
if [ ! -f .env ]; then
    cp example.env .env
fi

# Load environment variables
source .env

# Check FLINK_DOWNLOAD_PATH set in .env file
if [[ -z "$FLINK_DOWNLOAD_PATH" ]]; then
    echo "FLINK_DOWNLOAD_PATH is not set. Please set it in .env file."
    exit 1
fi

# Check if the path is a real directory
if [ ! -d "$FLINK_DOWNLOAD_PATH" ]; then
    echo "$FLINK_DOWNLOAD_PATH does not exist"
    exit 1
fi

# Check if Flink's already been downloaded to the directory
if [[ -d "$FLINK_DOWNLOAD_PATH/flink-$FLINK_VERSION" ]]; then
    echo "Warning: Flink download exists in $FLINK_DOWNLOAD_PATH"
else

    # Check that the directory is writable by the current user
    if ! test -w "$FLINK_DOWNLOAD_PATH"; then
        echo "Error: cannot write to directory $FLINK_DOWNLOAD_PATH. Please change the path to a different directory."
        exit 1
    fi

    # Extract Flink archive
    tar -xzf flink-1.17.0-bin-scala_2.12.tgz -C "$FLINK_DOWNLOAD_PATH"
    if [ $? -ne 0 ]; then
        echo "Error: failed to extract Flink archive"
        exit 1
    fi

fi

echo "FLINK_HOME: $FLINK_HOME"

# Add $FLINK_HOME/bin to your PATH variable
export PATH=$FLINK_HOME/bin:$PATH
