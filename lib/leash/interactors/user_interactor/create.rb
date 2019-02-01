require 'hanami/interactor'

module UserInteractor
  class Create

    class Validator
      include Hanami::Validations

      REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
      REGEX_PASSWORD = /\A[\w+\-.]+\z/i

      validations do
        required(:email).filled(:str?, format?: REGEX_EMAIL)
        required(:password).filled(:str?, size?: 8..40, format?: REGEX_PASSWORD)
      end
    end

    include Hanami::Interactor

    expose :user

    def initialize(repository: UserRepository.new)
      @repository = repository
    end

    def call(params)
      @user = @repository.create_with_credentials(
        password_plain: params[:password],
        email: params[:email]
      )
    end

    private
      def valid?(params)
        @validator ||= Validator.new(params)
        result = @validator.validate

        if result.failure?
          error(result.messages)
        end

        result.success?
      end

  end
end
