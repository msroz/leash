namespace :user do
  desc 'Create a user with credentials'
  task :create, [:name, :email, :password] => :environment do |task, args|
    interactor = UserInteractor::Create.new
    result = interactor.call(args)

    if result.success?
      STDOUT.puts result.user.to_h
    else
      STDERR.puts "Error"
    end
  end
end
