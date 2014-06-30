module DockerAlias
  class Configuration
    attr_accessor :repo, :tag, :cache_buster_key
    attr_writer :options, :enviroments, :port_maps

    def initialize
      @repo = 'seapy/docker_alias'
      @tag = 'latest'
      @cache_buster_key = 'CACHE_BUSTER_'
      @options = []
      @enviroments = {}
      @port_maps = []
    end

    def build_name
      "#{@repo}:#{@tag}"
    end

    def options
      @options.join(" ")
    end

    def port_maps
      @port_maps.map{ |x| "-p #{x}" }.join(" ")
    end

    def enviroments
      envs = []
      @enviroments.each do |key, value|
        envs << "-e #{key}=#{value}"
      end
      envs.join(" ")
    end
  end
end
