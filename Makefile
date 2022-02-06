REQ_FILE=requirements.txt
VERSION=3.9.2


.PHONY: setup-pyenv
setup-pyenv:
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	~/.pyenv/bin/pyenv install $(VERSION)

.PHONY: install-packages
install-packages:
	~/.pyenv/versions/$(VERSION)/bin/python$(version) -m venv venv
	./venv/bin/pip install -r $(REQ_FILE)

.PHONY: init
init:
	gcloud services enable dataflow.googleapis.com
	gcloud services enable pubsub.googleapis.com
	gsutil mb gs://$$DEVSHELL_PROJECT_ID
	gcloud pubsub topics create sandiego
	bq mk --dataset $$DEVSHELL_PROJECT_ID:demos 
	gsutil cp gs://la-gcloud-course-resources/sandiego/sensor_obs2008.csv.gz ./data/.
	./run_oncloud.sh $$DEVSHELL_PROJECT_ID $$DEVSHELL_PROJECT_ID AverageSpeeds


.PHONY: run
run:
	./venv/bin/python ./src/send_sensor_data.py --speedFactor=60 --project=$$DEVSHELL_PROJECT_ID

.PHONY: docker-build
docker-build:
	docker build . -t kpmg:latest

.PHONY: docker-run
docker-run:
	docker run -d --name kpmg kpmg:latest python ./src/send_sensor_data.py --speedFactor=60 --project=$$DEVSHELL_PROJECT_ID
