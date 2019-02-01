# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
get '/hello', to: ->(env) {
  [
    200,
    { 'Content-Type' => 'application/json' },
    [ { message: 'Hello Hanami!' }.to_json ]
  ]
}
post '/users', to: 'users#create'
