module Bff
  class QueryType < GraphQL::Schema::Object

    field :hello, String, null: false

    def hello
      require 'net/http'
      require 'uri'
      uri = URI.parse("http://localhost:2300/graph/graphql")
      request = Net::HTTP::Post.new(uri.request_uri)
      request["Accept"] = "application/json"
      request["Content-Type"] = "application/json"
      query = "query Hello { hello }"
      body = {}
      body['query'] = query
      body['variables'] = {}
      body['operationName'] = "Hello"
      request.body = JSON.generate(body)

      response = Net::HTTP.new(uri.host, uri.port).request(request)
      json = JSON.parse(response.body)
      json["data"]["hello"]
    end
  end
end
