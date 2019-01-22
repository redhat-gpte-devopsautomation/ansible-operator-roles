#!/bin/bash
# The following variables would from the ansible-operator
# - meta.namespace
# - meta.name (from the name of the CR)
# Set to valid values when running the playbook outside of the operator

ansible-playbook ./playbooks/gogs.yaml \
  -e "_postgresql_state=absent" \
  -e "_gogs_state=absent" \
  -e '{"meta": {"namespace":"xyz-gogs","name":"gogs"}}'
