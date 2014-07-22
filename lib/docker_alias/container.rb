module DockerAlias
  class Container
    def self.start
      puts "docker run --name #{DockerAlias.run_name} #{DockerAlias.options} -d #{DockerAlias.build_name}"
    end

    def self.stop
      puts "docker stop --name #{DockerAlias.build_name}"
    end

    def self.rm
      puts "docker rm --name #{DockerAlias.build_name}"
    end

    def self.bash
      exec "#{DockerAlias.console} /bin/bash"
    end
  end
end
