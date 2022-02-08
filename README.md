
Data Pipeline on GCP with Pub/Sub, Dataflow, and BigQuery 
=============
In this demo we will create a Data Pipeline pipeline to analyze a simulated stream of San Diego traffic data in real time.
The simulated data is actually a live highway sensor data which will be published to a Cloud Pub/Sub topic. 
Then a Dataflow streaming pipeline will subscribe to it.
The pipeline will take this data and transform it, and insert it into a BigQuery table

* All credit for the data rests with Google. We are using it to make the pipeline work with a standard stream of data
* The original GitHub page is at the below link: https://github.com/GoogleCloudPlatform/training-data-analyst

![idea](https://user-images.githubusercontent.com/21346531/152877563-1681a792-08d3-4b1f-9ca0-33fba5282ca4.png)
=======


Prepare your environment
------------
Log in your Google Cloud Platform. You can either select a project or create a new project withing your GCP. <br />
Then open the Google Cloud Shell and clone this repository

```bash
git clone git@github.com:saeedmehr/data_pup_sub.git
```

install python3.9
------------

```
make setup-pyenv
```

install requirements
-----------

```
make install-packages
```
------------

to run the app
```
make init
make run

```
## Setup with docker

run the app via docker
```
make docker-build
make docker-run
```


## Query for testing the DB

Run this query to see the current streamed data (which is being added every 5 secs)
```
SELECT * FROM `database_name. demos.average_speeds` LIMIT 100
```

Run this query to view which highway lanes have the most sensor counts
```
SELECT lane , sum(lane) as total 
FROM `demos. average_speeds` 
GROUP BY lane
ORDER BY total DESC
```
Run this query to view which lanes have the max average speed
```
SELECT lane , avg(speed) as average_speed 
FROM `demos. average_speeds` 
GROUP BY lane
ORDER BY average_speed DESC
```

