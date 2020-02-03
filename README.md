# Folio Test Module 

This repo will run the the Okapi test module and register it with the Okapi proxy. This is a docker-compose implementation of the following tutorial.

https://dev.folio.org/tutorials/curriculum/02-initialize-okapi-from-the-command-line/#start-the-okapi-gateway

## Prerequisites

Functioning Docker Desktop installation (or equivalent)

## Steps

To run Okapi with the okapi-test-module-fat.jar:

git clone https://github.com/acornwe3/folio-docker-compose.git  
cd folio-docker-compose. 
docker-compose up

## Testing 

curl -i -w '\n'  -H "X-Okapi-Tenant: diku"  -X GET http://localhost:9130/testb

