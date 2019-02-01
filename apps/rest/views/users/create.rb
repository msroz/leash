module Rest
  module Views
    module Users
      class Create
        include Rest::View

        format :json

        def render
          raw JSON.generate(user.to_h)
        end
      end
    end
  end
end
