namespace :dockera do
  desc "도커 이미지 빌드"
  task :build do
    DockerAlias.build
  end

  desc "도커 이미지 업로드"
  task :push do
    DockerAlias.push
  end

  namespace :con do
    desc "도커 컨테이너 실행"
    task :start do
      DockerAlias::Container.start
    end

    desc "도커 컨테이너 중지"
    task :stop do
      DockerAlias::Container.stop
    end

    desc "도커 컨테이너 삭제"
    task :rm do
      DockerAlias::Container.rm
    end

    desc "도커 컨테이너 bash 실행"
    task :bash do
      DockerAlias::Container.bash
    end
  end

  namespace :db do
    desc "도커 DB 생성"
    task :create do
      DockerAlias::Db.create
    end

    desc "도커 DB 초기 설정. 마이그레이션 및 시드 데이터 추가"
    task :setup do
      DockerAlias::Db.setup
    end

    desc "도커 DB 마이그레이트"
    task :migrate do
      DockerAlias::Db.migrate
    end
  end
end