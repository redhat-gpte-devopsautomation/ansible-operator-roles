#!/bin/bash
# The playbook expects the following variables to be set
# - jenkins_volume_size
# - jenkins_disable_administrative_monitors

# The following variables would from the ansible-operator
# - meta.namespace
# - meta.name (from the name of the CR)
# Set to valid values when running the playbook outside of the operator

ansible-playbook ./playbooks/jenkins.yaml \
  -e "jenkins_volume_size=2Gi" \
  -e "jenkins_disable_administrative_monitors=true" \
  -e '{"meta": {"namespace":"xyz-jenkins","name":"jenkins"}}'
