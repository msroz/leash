module Graph
  class QueryType < GraphQL::Schema::Object

    field :hello, String, null: false
    field :entries, [::Graph::EntryObject], null: false
    field :entry, ::Graph::EntryObject, null: false do
      argument :id, ID, required: true
    end

    def hello
      "Hello GraphQL"
    end

    def entries
      repository = EntryRepository.new
      repository.order_desc_by_created_at
    end

    def entry(id:)
      repository = EntryRepository.new
      repository.find(id)
    end
  end
end
