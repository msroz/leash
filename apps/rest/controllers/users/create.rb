module Rest
  module Controllers
    module Users
      class Create
        include Rest::Action

        expose :user

        def initialize(interactor: UserInteractor::Create.new)
          @interactor = interactor
        end

        def call(params)
          interactor_result = @interactor.call(params)

          if interactor_result.successful?
            @user = interactor_result.user
            self.status = 200
          else
            halt 422, 'Unprocessable'
          end
        end
      end
    end
  end
end
