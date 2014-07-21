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

```shell
bin/rake dockera:build
bin/rake dockera:push

bin/rake dockera:con:start
bin/rake dockera:con:stop
bin/rake dockera:con:rm
bin/rake dockera:con:bash

bin/rake dockera:db:create
bin/rake dockera:db:setup
bin/rake dockera:db:migrate
bin/rake dockera:db:schema:load
```

## Configuration

```ruby
# config/initializers/docker_alias.rb
DockerAlias.configure do |config|
  config.repo = 'seapy/docker_alias'
  config.tag = 'latest'
  config.cache_buster_key = 'CACHE_BUSTER_'
  config.options = [
    '--link mysql:mysql',
    '--link redis:redis',
    '--rm'
  ]
  config.enviroments = {
    'SECRET_KEY_BASE' => ENV['RORLA_SECRET_KEY_BASE'],
    'TEST_KEY' => 'yo'
  }
  config.port_maps = [
    '80:80',
    '3306:3306',
  ]
end
```

### `cache_buster_key`

if provided `cache_buster_key`, DockerAlias replace string from your `Dockerfile`.

if your Dockerfile like this

```shell
RUN echo "CACHE_BUSTER_0"
```

and cache_buster_key is set `CACHE_BUSTER_`
`Dockerfile` changed like this, when you docker build

```shell
RUN echo "CACHE_BUSTER_1404132922"
```

`1404132922` is build timestamp.

you must append number after `cache_buster_key`

```shell
RUN echo "CACHE_BUSTER_23"  # it's ok
RUN echo "CACHE_BUSTER_jasd"  # not ok
RUN echo "CACHE_BUSTER_"  # not ok
```

## Contributing

1. Fork it ( https://github.com/seapy/docker_alias/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Change logs

* added dockera:db:schema:load by lucius, July 21, 2014
