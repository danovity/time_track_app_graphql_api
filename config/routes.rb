Rails.application.routes.draw do
  get '/check.txt', to: proc {[200, {}, ['it_works']]}
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
