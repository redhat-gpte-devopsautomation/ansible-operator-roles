#!/bin/bash
# The playbook expects the following variables to be set
# - postgresql_volume_size
# - gogs_volume_size
# - gogs_ssl

# The following variables would from the ansible-operator
# - meta.namespace
# - meta.name (from the name of the CR)
# Set to valid values when running the playbook outside of the operator

ansible-playbook ./playbooks/gitea.yaml \
  -e "postgresql_volume_size=2Gi" \
  -e "gitea_volume_size=3Gi" \
  -e "gitea_ssl=True" \
  -e "gitea_image_tag=latest" \
  -e "gitea_route=gitea.apps.shared-dev.dev.openshift.opentlc.com" \
  -e '{"meta": {"namespace":"xyz-gitea","name":"gitea"}}'
