module Graph
  module Controllers
    module Graphql
      class Execute
        include Graph::Action

        def call(params)
          variables = ensure_hash(params[:variables])
          query = params[:query]
          operation_name = params[:operationName]
          context = {
          }

          Hanami.logger.debug("variables:#{variables}")
          Hanami.logger.debug("query:#{pretty_printing_query(query)}")
          Hanami.logger.debug("operationName:#{operation_name}")
          result = ::Graph::Schema.execute(
            query,
            variables: variables,
            context: context,
            operation_name: operation_name
          )

          self.status = 200
          self.body = JSON.generate(result)
        rescue StandardError => e
          # FIXME: error handling in production
          raise e
        end

        private

          def ensure_hash(ambiguous_param)
            case ambiguous_param
            when String
              unless ambiguous_param.nil?
                {}
              else
                ensure_hash(JSON.parse(ambiguous_param))
              end
            when Hash
              ambiguous_param
            when nil
              {}
            else
              raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
            end
          end

          def pretty_printing_query(query)
            (query || "").gsub(/(\r\n|\r|\n)/, ' ').gsub(/\s+/, ' ').to_s
          rescue StandardError
            ""
          end
      end
    end
  end
end
