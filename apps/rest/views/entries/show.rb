module Rest
  module Views
    module Entries
      class Show
        include Rest::View

        format :json

        def render
          raw JSON.generate(entry.to_h)
        end
      end
    end
  end
end
