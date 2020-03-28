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
  -e "nexus_image=docker.io/sonatype/nexus3" \
  -e "nexus_image_tag=latest" \
  -e "nexus_new_admin_password=redhat" \
  -e '{"meta": {"namespace":"xyz-nexus","name":"nexus"}}'
  #-e "nexus_route=nexus.apps.shared-dev.dev.openshift.opentlc.com" \
  #-e "nexus_registry_route=nexus-registry.apps.shared-dev.dev.openshift.opentlc.com" \
