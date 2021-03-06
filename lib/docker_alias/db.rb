module DockerAlias
  class Db
    def self.create
      puts "#{DockerAlias.console} bundle exec rake db:create"
    end

    def self.setup
      puts "#{DockerAlias.console} bundle exec rake db:setup"
    end

    def self.migrate
      puts "#{DockerAlias.console} bundle exec rake db:migrate"
    end
  end
end