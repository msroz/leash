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
resources :users, only: [:create]
resources :entries, only: [:index, :show] do
  resources :comments, only: [:index]
end
