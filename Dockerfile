FROM python:3.9.2

ARG DEVSHELL_PROJECT_ID=demos

RUN mkdir /code

WORKDIR /code

# copy files
ADD ./src ./src
ADD ./data ./data
ADD ./pom.xml ./pom.xml
ADD ./README.md ./README.md
ADD ./run_oncloud.sh ./run_oncloud.sh


# to install packages
COPY ./requirements.txt /code/requirements.txt
RUN pip install -r requirements.txt

CMD ["python", "./src/send_sensor_data.py",  "--speedFactor=60", "--project=$DEVSHELL_PROJECT_ID"]
