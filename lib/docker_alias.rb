require "docker_alias/version"

module DockerAlias
  # Your code goes here...
  # Railtie to hook into Rails.
  class Railtie < Rails::Railtie
    rake_tasks do
      load "docker_alias/tasks/docker_alias.rake" 
    end
  end
end
