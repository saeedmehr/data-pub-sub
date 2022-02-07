Data Pipeline on GCP with Pub/Sub, Dataflow, and BigQuery 
=============
In this demo we will create a Data Pipeline pipeline to analyze a simulated stream of San Diego traffic data in real time.
The simulated data is actually a live highway sensor data which will be published to a Cloud Pub/Sub topic. 
Then a Dataflow streaming pipeline will subscribe to it.
The pipeline will take this data and transform it, and insert it into a BigQuery table

* All credit for the data rests with Google. We are using it to make the pipeline work with a standard stream of data
* The original GitHub page is at the below link: https://github.com/GoogleCloudPlatform/training-data-analyst

install python3.9
------------
tozihat
```
make setup-pyenv
```

install requirements
-----------
tozihat
```
make req
```

------------

## Setup with docker

to run the app
```
make run
```

run the app via docker
```
make docker-build
make docker-run
```




