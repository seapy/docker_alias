module DockerAlias
  class Db
    def self.create
      puts "#{DockerAlias.console} bundle exec rake db:create"
      system "#{DockerAlias.console} bundle exec rake db:create"
    end

    def self.setup
      puts "#{DockerAlias.console} bundle exec rake db:setup"
      system "#{DockerAlias.console} bundle exec rake db:setup"
    end

    def self.reset
      puts "#{DockerAlias.console} bundle exec rake db:reset"
      system "#{DockerAlias.console} bundle exec rake db:reset"
    end

    def self.migrate
      puts "#{DockerAlias.console} bundle exec rake db:migrate"
      system "#{DockerAlias.console} bundle exec rake db:migrate"
    end

    def self.schema_load
      puts "#{DockerAlias.console} bundle exec rake db:schema:load"
      system "#{DockerAlias.console} bundle exec rake db:schema:load"
    end
  end
end
