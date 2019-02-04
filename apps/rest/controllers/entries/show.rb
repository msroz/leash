module Rest
  module Controllers
    module Entries
      class Show
        include Rest::Action

        expose :entry

        def call(params)
          repository = EntryRepository.new
          @entry = repository.find(params[:id])

          if @entry.nil?
            self.status = 404
          else
            self.status = 200
          end
        end
      end
    end
  end
end
