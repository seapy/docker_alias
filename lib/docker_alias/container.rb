module DockerAlias
  class Container
    def self.start
      puts "docker run --name #{DockerAlias.run_name} #{DockerAlias.options} -d #{DockerAlias.build_name}"
      system "docker run --name #{DockerAlias.run_name} #{DockerAlias.options} -d #{DockerAlias.build_name}"
    end

    def self.stop
      puts "docker stop #{DockerAlias.build_name}"
      system "docker stop #{DockerAlias.build_name}"
    end

    def self.rm
      puts "docker rm #{DockerAlias.build_name}"
      system "docker rm #{DockerAlias.build_name}"
    end

    def self.bash
      puts "#{DockerAlias.console} /bin/bash"
      system "#{DockerAlias.console} /bin/bash"
    end
  end
end
