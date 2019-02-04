require 'hanami/interactor'

module EntryInteractor
  class Create

    class Validator
      include Hanami::Validations

      validations do
        required(:title).filled(:str?, size?: 1..50)
        required(:body).filled(:str?, size?: 1..5000)
        required(:author_id).filled(:int?)
      end
    end

    include Hanami::Interactor

    expose :user

    def initialize(repository: EntryRepository.new)
      @repository = repository
    end

    def call(params)
      @user = @repository.create(
        title: params[:title],
        body: params[:body],
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
