module Queries
  module Resolvers
    class User < GraphQL::Schema::Resolver
      type Types::UserType, null: false
      description "特定Userの取得"

      argument :id, String, required: true, description: "Userのid"

      def resolve(params)
        ::User.find(params[:id])
      end
    end
  end
end
