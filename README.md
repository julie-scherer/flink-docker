# Running Flink on your local computer

## :rocket: Getting started

1. Open a terminal, fork/clone the repo, and navigate (`cd`) to the project folder.

2. Copy `example.env` to `.env` file and adjust the settings to your liking. If you want to skip, the `download-flink.sh` script will copy it for you.
    
    ```bash
    cp example.env .env
    ```

3. Run the commands below:

    ```bash
    make download # if you have make installed

    # OR, just run these commands
    chmod +x ./scripts/download-flink.sh
    ./scripts/download-flink.sh
    ```

    ```bash
    make start # if you have make installed

    # OR, just run the commands below
    chmod +x ./scripts/start-flink.sh
    ./scripts/start-flink.sh
    ```

    &rarr; The **`download-flink.sh`** script will:
    - Check that `FLINK_DOWNLOAD_PATH` is set in `.env` file and that it is an actual directory on the local computer (default is `$PWD` from `example.env`).
    - Check if Flink has already been downloaded in `FLINK_DOWNLOAD_PATH`. If not, it will first check if the `FLINK_DOWNLOAD_PATH` directory is writable; otherwise, it will exit with an error status since it cannot write to that folder. Otherwise, it will extract the files from the `.tgz` file and write them to the `FLINK_DOWNLOAD_PATH` directory specified in the `.env` file.

    &rarr; The `start-flink.sh` script, you guessed it, starts Flink!
    - Once you have Flink installed and set up the environment variables, this script will start Flink by running a very simple command: `$FLINK_HOME/bin/start-cluster.sh`.

4. Last but not least, verify that Flink is running correctly. Open a web browser and go to http://localhost:8081/. This will bring up the Flink web interface, which shows you the status of the Flink cluster.

**:tada: That's it! You should now have Flink installed and running on your local machine.**

## :star: Check out my notion to learn more!

Learn more about Flink, the steps I followed for installation, and my take-aways from conversating with chatGPT in my notion, [Apache Flink Overview](https://schererjulie.notion.site/Apache-Flink-Overview-d39df57222164ceda09d7c4031cba5df).
