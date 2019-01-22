#!/bin/bash
# The following variables would from the ansible-operator
# - meta.namespace
# - meta.name (from the name of the CR)
# Set to valid values when running the playbook outside of the operator

ansible-playbook ./playbooks/jenkins.yaml \
  -e "_jenkins_state=absent" \
  -e '{"meta": {"namespace":"xyz-jenkins","name":"jenkins"}}'
