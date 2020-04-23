import groovy.json.JsonSlurper

parsed_args = new JsonSlurper().parseText(args)

def existingRepository = repository.getRepositoryManager().get(parsed_args.name)
if (existingRepository != null) {
  existingRepository.stop()
  repository.getRepositoryManager().delete(parsed_args.name)  
}
repository.createMavenGroup(parsed_args.name, parsed_args.member_repos, parsed_args.blob_store)
