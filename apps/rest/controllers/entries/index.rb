module Rest
  module Controllers
    module Entries
      class Index
        include Rest::Action

        expose :entries

        def call(params)
          repository = EntryRepository.new
          @entries = repository.order_desc_by_created_at

          self.status = 200
        end
      end
    end
  end
end
