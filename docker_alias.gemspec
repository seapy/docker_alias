# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docker_alias/version'

Gem::Specification.new do |spec|
  spec.name          = "docker_alias"
  spec.version       = DockerAlias::VERSION
  spec.authors       = ["seapy"]
  spec.email         = ["iamseapy@gmail.com"]
  spec.summary       = %q{도커 명령어를 출력}
  spec.description   = %q{도커 명령어에서 자주 사용하는 옵션을 포함하고 환경변수등도 포함해서 붙여넣기 하면 사용할 수 있도록 한다. docker-api 사용하는것들보다는 직접 명령어를 통해서 도커를 실행해본다는 의도.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "railties", ">= 3.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
