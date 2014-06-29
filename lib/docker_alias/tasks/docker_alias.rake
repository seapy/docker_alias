def add_enviroment
  envs = []
  envs << "-e SECRET_KEY_BASE=\"#{ENV['RORLA_SECRET_KEY_BASE']}\""
  envs.join(' ')
end

def add_link
  links = []
  links << "--link mysql:mysql"
  links.join(' ')
end

def add_option
  "#{add_link} #{add_enviroment}"
end

def build_name(repo, tag)
  "#{repo}:#{tag}"
end

def docker_console(repo, tag)
  "docker run -i -t --rm #{add_option} #{build_name(repo, tag)}"
end

namespace :dockera do
  desc "도커 이미지 빌드"
  task :build, [:repo, :tag] do |t, args|
    repo = args[:repo]
    tag = args[:tag]
    # 도커의 캐쉬가 명령어 기반이라서 해당 부분의 문자열을 바꿔주어 그 이후부터 캐쉬 이용하지 않도록함. https://github.com/dotcloud/docker/issues/1996
    system("sed -i '' s/CACHE_BUSTER_[0-9]*/CACHE_BUSTER_#{Time.now.to_i}/g Dockerfile")
    system("docker build --force-rm -t #{build_name(repo, tag)} .")
  end

  namespace :con do
    desc "도커 컨테이너 실행"
    task :start, [:repo, :tag] do |t, args|
      repo = args[:repo]
      tag = args[:tag]
      command = "docker run --name #{build_name(repo, tag)} #{add_option} -d -p 80:80 #{build_name(repo, tag)}"
      puts command
    end

    desc "도커 컨테이너 중지"
    task :stop, [:repo, :tag] do |t, args|
      repo = args[:repo]
      tag = args[:tag]
      command = "docker stop --name #{build_name(repo, tag)}"
      puts command
    end

    desc "도커 컨테이너 삭제"
    task :rm, [:repo, :tag] do |t, args|
      repo = args[:repo]
      tag = args[:tag]
      command = "docker rm --name #{build_name(repo, tag)}"
      puts command
    end

    desc "도커 컨테이너 bash 실행"
    task :console, [:repo, :tag] do |t, args|
      repo = args[:repo]
      tag = args[:tag]
      command = "#{docker_console(repo, tag)} /bin/bash"
      puts command
    end
  end

  namespace :db do
    desc "도커 DB 생성"
    task :create, [:repo, :tag] do |t, args|
      repo = args[:repo]
      tag = args[:tag]
      command = "#{docker_console(repo, tag)} bundle exec rake db:create"
      puts command
    end

    desc "도커 DB 초기 설정. 마이그레이션 및 시드 데이터 추가"
    task :setup, [:repo, :tag] do |t, args|
      repo = args[:repo]
      tag = args[:tag]
      command = "#{docker_console(repo, tag)} bundle exec rake db:setup"
      puts command
    end

    desc "도커 DB 마이그레이트"
    task :migrate, [:repo, :tag] do |t, args|
      repo = args[:repo]
      tag = args[:tag]
      command = "#{docker_console(repo, tag)} bundle exec rake db:migrate"
      puts command
    end
  end
end