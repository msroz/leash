require 'hanami/interactor'

module CommentInteractor
  class Create

    class Validator
      include Hanami::Validations

      validations do
        required(:body).filled(:str?, size?: 1..5000)
        required(:entry_id).filled(:int?)
        required(:author_id).filled(:int?)
      end
    end

    include Hanami::Interactor

    expose :user

    def initialize(repository: CommentRepository.new)
      @repository = repository
    end

    def call(params)
      @user = @repository.create(
        body: params[:body],
        entry_id: params[:entry_id],
        author_id: params[:author_id],
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
