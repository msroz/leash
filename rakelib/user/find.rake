namespace :user do
  desc 'Find a user by id'
  task :find, [:id] => :environment do |task, args|
    repository = UserRepository.new
    user = repository.find(args[:id])

    STDOUT.puts user.to_h
  end
end
