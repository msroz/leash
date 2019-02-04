require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/leash'
require_relative '../apps/web/application'
require_relative '../apps/rest/application'
require_relative '../apps/graph/application'

require "hanami/middleware/body_parser"

Hanami.configure do
  mount Graph::Application, at: '/graph'
  mount Rest::Application, at: '/rest'
  mount Web::Application, at: '/'

  middleware.use Hanami::Middleware::BodyParser, :json

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/leash_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/leash_development'
    #    adapter :sql, 'mysql://localhost/leash_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/leash/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
