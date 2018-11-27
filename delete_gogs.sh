#!/bin/bash
# The playbook expects the following variables to be set
# - postgresql_volume_size
# - gogs_volume_size
# - gogs_ssl

# The following variables would from the ansible-operator
# - meta.namespace
# - meta.name (from the name of the CR)
# Set to valid values when running the playbook outside of the operator

ansible-playbook ./playbook.yaml \
  -e "_postgresql_state=absent" \
  -e "_gogs_state=absent" \
  -e '{"meta": {"namespace":"wkgogs","name":"gogs1"}}'
