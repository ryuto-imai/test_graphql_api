Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root "hello#hello"

  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#user'
  post 'users', to: 'users#add'
end
