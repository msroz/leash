module Rest
  module Controllers
    module Entries
      module Comments
        class Index
          include Rest::Action

          expose :comments

          def call(params)
            repository = CommentRepository.new
            @comments = repository.by_entry_id(params[:entry_id])

            self.status = 200
          end
        end
      end
    end
  end
end
