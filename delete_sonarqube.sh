#!/bin/bash
# The following variables would from the ansible-operator
# - meta.namespace
# - meta.name (from the name of the CR)
# Set to valid values when running the playbook outside of the operator

ansible-playbook ./playbooks/sonarqube.yaml \
  -e "_postgresql_state=absent" \
  -e "_sonarqube_state=absent" \
  -e "postgresql_volume_size=2Gi" \
  -e "sonarqube_volume_size=3Gi" \
  -e '{"meta": {"namespace":"xyz-sonarqube","name":"sonarqube"}}'
