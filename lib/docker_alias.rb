require "docker_alias/version"
require "docker_alias/configuration"
require "docker_alias/container"
require "docker_alias/db"

module DockerAlias
  class << self
    attr_writer :configuration
  end

  # Railtie to hook into Rails.
  class Railtie < Rails::Railtie
    rake_tasks do
      load "docker_alias/tasks/docker_alias.rake" 
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.build
    # 도커의 캐쉬가 명령어 기반이라서 해당 부분의 문자열을 바꿔주어 그 이후부터 캐쉬 이용하지 않도록함. https://github.com/dotcloud/docker/issues/1996
    cache_key = configuration.cache_buster_key
    cache_buster_cmd = "sed -i '' s/#{cache_key}[0-9]*/#{cache_key}#{Time.now.to_i}/g Dockerfile"
    system(cache_buster_cmd)
    system("docker build --force-rm -t #{configuration.build_name} .")
  end

  def self.push
    system("docker push #{configuration.build_name}")
  end

  def self.console
    "docker run -i -t --rm #{options} #{build_name}"
  end

  private
  def self.build_name
    DockerAlias.configuration.build_name
  end

  def self.run_name
    DockerAlias.configuration.build_name.tr('/:', '_')
  end

  def self.options
    options = []
    options << DockerAlias.configuration.options
    options << DockerAlias.configuration.enviroments
    options << DockerAlias.configuration.port_maps
    options.reject{ |x| x.nil? || x.empty? || x.length == 0 }.join(" ")
  end
end
