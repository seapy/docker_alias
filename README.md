# DockerAlias

`docker` 명령어를 출력해서 쉽게 사용하게 하는 rake task 젬

## Installation

Add this line to your application's Gemfile:

    gem 'docker_alias'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docker_alias

## Usage

환경변수에 필요한 값은 선언이 되어 있어야함

```shell
rake dockera:build[seapy/railsapp,v0.0.1]
rake dockera:push[seapy/railsapp,v0.0.1]

rake dockera:con:start[seapy/railsapp,v0.0.1]
rake dockera:con:stop[seapy/railsapp,v0.0.1]
rake dockera:con:rm[seapy/railsapp,v0.0.1]
rake dockera:con:console[seapy/railsapp,v0.0.1]

rake dockera:db:create[seapy/railsapp,v0.0.1]
rake dockera:db:setup[seapy/railsapp,v0.0.1]
rake dockera:db:migrate[seapy/railsapp,v0.0.1]
```

## Contributing

1. Fork it ( https://github.com/seapy/docker_alias/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
