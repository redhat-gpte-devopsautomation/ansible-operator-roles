#!/bin/bash
# The playbook expects the following variables to be set
# - nexus_volume_size
# - nexus_ssl

# The following variables would from the ansible-operator
# - meta.namespace
# - meta.name (from the name of the CR)
# Set to valid values when running the playbook outside of the operator

ansible-playbook ./playbooks/nexus.yaml \
  -e "nexus_volume_size=5Gi" \
  -e "nexus_ssl=True" \
  -e "nexus_image_tag=3.17.0" \
  -e '{"meta": {"namespace":"nexus-test","name":"nexus"}}' \
  -e "new_nexus_admin_password=sweetie"
