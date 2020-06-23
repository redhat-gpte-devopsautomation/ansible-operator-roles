#!/bin/bash
# The Shell script can be used to provision a Nexus instance. 
# Any variable can be set using -e
# All variables have sensible defaults if not specified.

# The following variables would from the ansible-operator
# - meta.namespace
# - meta.name (from the name of the CR)
# Set to valid values when calling the playbook outside of the operator

ansible-playbook ./playbooks/nexus.yaml \
  -e '{"meta": {"namespace":"xyz-nexus","name":"nexus"}}' \
  -e "nexus_volume_size=5Gi" \
  -e "nexus_ssl=True" \
  -e "nexus_image=docker.io/sonatype/nexus3" \
  -e "nexus_image_tag='3.24.0'" \
  -e "nexus_new_admin_password=redhat" \
  -e 'nexus_enable_anonymous=True' \
  -e 'nexus_ocp_cpu_request="4"' \
  -e 'nexus_ocp_cpu_limit="4"' \
  -e 'nexus_repos_delete_default=True'

  # -e "nexus_admin_password=redhat" \
  # -e '{"nexus_ocp_repos_maven_proxy": [{"name": "maven-central","remote_url": "https://repo1.maven.org/maven2/","blob_store": "default","strict_content_validation": true,"version_policy": "release","layout_policy": "strict"},{"name": "rh-ga","remote_url": "https://maven.repository.redhat.com/ga/","blob_store": "default","strict_content_validation": true,"version_policy": "release","layout_policy": "strict"}]}' \
  # -e '{"nexus_ocp_repos_maven_hosted": [{"name": "releases","blob_store": "default","write_policy": "allow","strict_content_validation": true,"version_policy": "release","layout_policy": "strict"}]}' \
  # -e '{"nexus_ocp_repos_docker_hosted": [{"name": "docker","http_port": 5000,"https_port": 5001,"v1_enabled": true,"blob_store": "default","strict_content_validation": true,"write_policy": "allow"}]}' \
  # -e '{"nexus_ocp_repos_maven_group":[{"name": "maven-all", "blob_store": "default","strict_content_validation": true, "member_repos": ["maven-central","rh-ga"]}]}' \
  # -e "nexus_route=nexus.apps.shared-dev4.dev4.openshift.opentlc.com" \
  # -e "nexus_registry_route=nexus-registry.apps.shared-dev4.dev4.openshift.opentlc.com" \
