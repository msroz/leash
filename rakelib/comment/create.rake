namespace :comment do
  desc 'Create random comment: default: 10'
  task :create_random, [:num_commets] => :environment do |_task, args|
    num_commets = args[:num_commets].to_i == 0 ? 10 : args[:num_commets].to_i

    interactor = CommentInteractor::Create.new
    user_repository = UserRepository.new
    entry_repository = EntryRepository.new

    1.upto(num_commets).each do |i|
      user = user_repository.all.sample
      entry = entry_repository.all.sample
      result = interactor.call(
        body: Faker::Lorem.sentence((50..100).to_a.sample),
        entry_id: entry.id,
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
