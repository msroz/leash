module Graph
  class EntryObject < ::Graph::BaseObject

    field :id, ID, null: false
    field :author_id, ID, null: false
    field :body, String, null: false
    field :title, String, null: false
    field :comments, [::Graph::CommentObject], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false

    def comments
      # FIXME: N+1 query
      repository = CommentRepository.new
      # NOTE: object is a Hash
      repository.by_entry_id(object[:id])
    end
  end
end
