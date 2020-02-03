#!/bin/bash
set -m 
java -javaagent:/opt/agent-bond/agent-bond.jar=jolokia{{host=0.0.0.0}},jmx_exporter{{9779:/opt/agent-bond/jmx_exporter_config.yml}} -cp . -jar /usr/verticles/okapi-core-fat.jar dev &
sleep 5

#register a tenant 
curl -i -w '\n' -X POST -H 'Content-type: application/json' \
	 -d @okapi-json-config/tenants/tenant.json \
	http://localhost:9130/_/proxy/tenants &

#register okapi modules
curl -i -w '\n' -X POST -H 'Content-type: application/json' \
	-d @okapi-json-config/descriptors/mod-test-1.0.0.json \
	http://localhost:9130/_/proxy/modules &
sleep 1

#register oriole for discovery
curl -i -w '\n' -X POST -H 'Content-type: application/json' \
  	-d @okapi-json-config/discovery/mod-test-1.0.0.json \
  	http://localhost:9130/_/discovery/modules

#enable tenant's okapi module
curl -i -w '\n' -X POST -H 'Content-type: application/json' \
  -d '{"id":"okapi-2.22.0"}' \
  http://localhost:9130/_/proxy/tenants/diku/modules

#enable tenant's oriole module
curl -i -w '\n' -X POST -H 'Content-type: application/json' \
	-d @okapi-json-config/enablement/mod-test-1.0.0.json \
	http://localhost:9130/_/proxy/tenants/diku/install

jobs
fg % 1