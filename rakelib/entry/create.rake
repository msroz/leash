namespace :entry do
  desc 'Create random entries: default: 10'
  task :create_random, [:num_entries] => :environment do |_task, args|
    num_entries = args[:num_entries].to_i == 0 ? 10 : args[:num_entries].to_i

    interactor = EntryInteractor::Create.new
    repository = UserRepository.new

    1.upto(num_entries).each do |i|
      user = repository.all.sample
      result = interactor.call(
        title: Faker::Lorem.sentence([1,2,3].sample),
        body: Faker::Lorem.sentence((50..100).to_a.sample),
        author_id: user.id
      )
      if result.success?
        STDOUT.puts "roop:#{i} success."
      else
        STDOUT.puts "roop:#{i} error. #{result.errors}"
      end
    end


  end
end
