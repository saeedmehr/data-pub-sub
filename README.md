test
=============
test

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

run tests via docker
```
make docker-test
```

-----------
## black and sort

to run black:
```
make black
```

run isort
```
make isort
```

-----------

# To run tests:
`pytest`

# Documantation
please see the docs [here](http://127.0.0.1:8000/docs) and [here](http://127.0.0.1:8000/redoc)

# Endpoints
* An endpoint that responds with a list of the first 10 fizzbuzz entities (i.e. number 1-10): `http://127.0.0.1:8000/fizzbuzz/list`
* An endpoint that includes a number parameter in the url path, e.g. fizzbuzz/15 and responds with the relevant fizzbuzz entity: `http://127.0.0.1:8000/fizzbuzz/15`


