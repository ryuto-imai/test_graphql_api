module Queries
  module Resolvers
    class User < GraphQL::Schema::Resolver
      type Types::UserType, null: false
      description "特定Userの取得"

      argument :id, String, required: true, description: "Userのid"

      def resolve(params)
        begin
          ::User.find(params[:id])  
        rescue ActiveRecord::RecordNotFound => exception
          raise GraphQL::ExecutionError.new(
            "id:#{params[:id]} not found",
            extensions: {
              code: Error::GraphqlError.codes[:not_found]
            }
          )
        end
      end
    end
  end
end
