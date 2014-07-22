module DockerAlias
  class Container
    def self.start
      puts ">>> docker run --name #{DockerAlias.run_name} #{DockerAlias.options} -d #{DockerAlias.build_name}"
      puts "=> "
      system "docker run --name #{DockerAlias.run_name} #{DockerAlias.options} -d #{DockerAlias.build_name}"
    end

    def self.stop
      puts ">>> docker stoputs #{DockerAlias.run_name}"
      puts "=> "
      system "docker stoputs #{DockerAlias.run_name}"
    end

    def self.rm
      puts ">>> docker rm #{DockerAlias.run_name}"
      puts "=> "
      system "docker rm #{DockerAlias.run_name}"
    end

    def self.bash
      puts ">>> #{DockerAlias.console} /bin/bash"
      puts "=> "
      system "#{DockerAlias.console} /bin/bash"
    end
  end
end
