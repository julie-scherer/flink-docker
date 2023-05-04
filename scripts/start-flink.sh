#!/bin/bash

set -e

# Load environment variables
source .env


# Once you have set up the environment variables, you can now start Flink
chmod +x $FLINK_HOME/bin/start-cluster.sh
$FLINK_HOME/bin/start-cluster.sh
