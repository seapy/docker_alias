module DockerAlias
  class Container
    def self.start
      puts ">>> docker run --name #{DockerAlias.run_name} #{DockerAlias.options} -d #{DockerAlias.build_name}"
      p "=> "
      system "docker run --name #{DockerAlias.run_name} #{DockerAlias.options} -d #{DockerAlias.build_name}"
    end

    def self.stop
      puts ">>> docker stop #{DockerAlias.run_name}"
      p "=> "
      system "docker stop #{DockerAlias.run_name}"
    end

    def self.rm
      puts ">>> docker rm #{DockerAlias.run_name}"
      p "=> "
      system "docker rm #{DockerAlias.run_name}"
    end

    def self.bash
      puts ">>> #{DockerAlias.console} /bin/bash"
      p "=> "
      system "#{DockerAlias.console} /bin/bash"
    end
  end
end
