#!/bin/bash
# The playbook expects the following variables to be set
# - postgresql_volume_size
# - sonarqube_volume_size
# - sonarqube_ssl

# The following variables would from the ansible-operator
# - meta.namespace
# - meta.name (from the name of the CR)
# Set to valid values when running the playbook outside of the operator

ansible-playbook ./playbooks/sonarqube.yaml \
  -e "postgresql_volume_size=2Gi" \
  -e "sonarqube_volume_size=3Gi" \
  -e "sonarqube_ssl=True" \
  -e '{"meta": {"namespace":"wkgogs","name":"sonarqube"}}'
