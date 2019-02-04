module Rest
  module Views
    module Entries
      class Index
        include Rest::View

        format :json

        def render
          raw JSON.generate(entries.map {|entry| entry.to_h})
        end
      end
    end
  end
end
