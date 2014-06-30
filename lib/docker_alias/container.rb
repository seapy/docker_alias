module DockerAlias
  class Container
    def self.start
      build_name = DockerAlias.build_name
      puts "docker run --name #{build_name} #{DockerAlias.options} -d #{build_name}"
    end

    def self.stop
      puts "docker stop --name #{DockerAlias.build_name}"
    end

    def self.rm
      puts "docker rm --name #{DockerAlias.build_name}"
    end

    def self.bash
      puts "#{DockerAlias.console} /bin/bash"
    end
  end
end