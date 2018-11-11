#!/bin/bash
# The playbook expects the following variables to be set
# - postgresql_port
# - postgresql_volume_size
# - gogs_port
# - gogs_volume_size

# The following variables come from the ansible-operator
# - meta.namespace
# - meta.name (from the name of the CR)

#ansible-playbook ./playbook_old.yaml -e "postgresql_port=5432" \
  # -e "postgresql_volume_size=2Gi" -e "gogs_volume_size=3Gi" \
  # -e "gogs_port=3000" -e '{"meta": {"namespace":"wkgogs","name":"gogs1"}}'

ansible-playbook ./playbook.yaml -e "postgresql_port=5432" \
  -e "postgresql_volume_size=2Gi" -e "gogs_volume_size=3Gi" \
  -e "gogs_port=3000" -e '{"meta": {"namespace":"wkgogs","name":"gogs1"}}' -e "gogs_ssl=True"

# ansible-playbook ./playbook.yaml -e "postgresql_port=5433" \
#   -e "postgresql_volume_size=2Gi" -e "gogs_volume_size=3Gi" \
#   -e "gogs_port=3001" -e '{"meta": {"namespace":"wkgogs","name":"gogs2"}}'
