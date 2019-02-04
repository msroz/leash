module Rest
  module Views
    module Entries
      module Comments
        class Index
          include Rest::View

          format :json

          def render
            raw JSON.generate(comments.map {|comment| comment.to_h})
          end
        end
      end
    end
  end
end
