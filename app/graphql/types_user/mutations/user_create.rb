TypesUser::Mutations::UserCreate = GraphQL::ObjectType.define do
  field :UserCreate do
    type TypesUser::UserType
    description 'Create a new user.'

    argument :firstName,        !types.String
    argument :lastName,         !types.String
    argument :emailAddress,     !types.String

    resolve ->(_object, arguments, _context) do
      first_name = arguments[:firstName]
      last_name = arguments[:lastName]
      email_address = arguments[:emailAddress]

      user =
        if User.find_by(email_address: email_address)
          User.find_by(email_address: email_address)
        else
          User.new(first_name: first_name, last_name: last_name, email_address: email_address)
        end

      if user.save
        user
      else
        "UserCreate Error"
      end
    end
  end
end
