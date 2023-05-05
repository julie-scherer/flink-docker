# Running Flink on your local computer

## :rocket: Getting started

1. Open a terminal, fork/clone the repo, and navigate (`cd`) to the project folder.

2. Copy `example.env` to `.env` file and adjust the settings to your liking.
    
    ```bash
    cp example.env .env
    ```

3. Run the commands below:

    ```bash
    make up # if you have make installed

    # OR, just run these commands
    export $(cat .env | xargs)
    docker build -t ${FLINK_IMAGE} . --build-arg FLINK_VERSION=${FLINK_VERSION} --build-arg SCALA_VERSION=${SCALA_VERSION}
	docker run --name ${FLINK_CONTAINER} -d -p 8081:8081 ${FLINK_IMAGE}
    ```

4. Check that Flink is running correctly. Open a web browser and go to http://localhost:8081/. This will bring up the Flink web interface, which shows you the status of the Flink cluster.

    **:tada: That's it! You should now have Flink installed and running on your local machine.**

5. Once you are done, clean up your Docker resources:

    ```bash
    make down # if you have make installed

    # OR, you can run the commands below manually
    docker stop ${FLINK_CONTAINER}
	docker rm ${FLINK_CONTAINER}
	docker rmi ${FLINK_IMAGE} --force
    ```

## :star: Check out my notion to learn more!

Learn more about Flink, the steps I followed for installation, and my take-aways from conversating with chatGPT in my notion, [Apache Flink Overview](https://schererjulie.notion.site/Apache-Flink-Overview-d39df57222164ceda09d7c4031cba5df).
