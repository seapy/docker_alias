module DockerAlias
  class Db
    def self.create
      puts "#{DockerAlias.console} bundle exec rake db:create"
    end
    def self.create_exec
      exec "#{DockerAlias.console} bundle exec rake db:create"
    end

    def self.setup
      puts "#{DockerAlias.console} bundle exec rake db:setup"
    end
    def self.setup_exec
      exec "#{DockerAlias.console} bundle exec rake db:setup"
    end

    def self.reset
      puts "#{DockerAlias.console} bundle exec rake db:reset"
    end
    def self.reset_exec
      exec "#{DockerAlias.console} bundle exec rake db:reset"
    end

    def self.migrate
      puts "#{DockerAlias.console} bundle exec rake db:migrate"
    end
    def self.migrate_exec
      exec "#{DockerAlias.console} bundle exec rake db:migrate"
    end

    def self.schema_load
      puts "#{DockerAlias.console} bundle exec rake db:schema:load"
    end
    def self.schema_load_exec
      exec "#{DockerAlias.console} bundle exec rake db:schema:load"
    end
  end
end
