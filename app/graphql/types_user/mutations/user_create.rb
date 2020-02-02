TypesUser::Mutations::UserCreate = GraphQL::ObjectType.define do
  field :UserCreate do
    type TypesUser::UserType
    description 'Create a new user.'

    argument :emailAddress,     !types.String

    resolve ->(_object, arguments, _context) do
      email_address = arguments[:emailAddress]

      user =
        if User.find_by(email_address: email_address)
          User.find_by(email_address: email_address)
        else
          User.new(email_address: email_address)
        end

      if user.save
        user
      else
        "UserCreate Error"
      end
    end
  end
end
