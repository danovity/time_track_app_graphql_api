require 'json'

namespace :graphql do
  namespace :schema do
    desc 'Dumps the IDL schema into ./app/graphql/schema.graphql'
    task dump_idl: [:environment] do
      api_target = Rails.root.join("app/graphql/schema.graphql")
      main_client_target = "#{File.expand_path("..", Dir.pwd)}/main/client/schema.graphql"
      schema = GraphQL::Schema::Printer.print_schema(GraphQLSchema)
      [api_target, main_client_target].each do |target|
        File.open(target, "w+") do |f|
          f.write(schema)
        end
      end
      puts "Schema dumped into api/app/graphql/schema.graphql and main/client/schema.graphql"
    end
  end

  desc 'Dumps both the IDL and result of introspection query in app/graphql'
  task schema_dump: ["graphql:schema:dump_idl"]
end
