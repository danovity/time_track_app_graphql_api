TypesUser::Queries::UserQueryType = GraphQL::ObjectType.define do
  field :User, TypesUser::UserType, 'Find an User by ID' do

    argument :id, !types.ID

    resolve ->(_object, arguments, context) do
      user_id = arguments[:id]

      if user_id
        User.find_by(id: user_id)
      end
    end
  end
end
