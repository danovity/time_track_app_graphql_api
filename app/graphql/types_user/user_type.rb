TypesUser::UserType =
  GraphQL::ObjectType.define do
    name 'User'
    description 'An User.'

    field :id, !types.ID
    field :firstName, !types.String, "User's First Name", property: :first_name
    field :lastName, !types.String, "User's Last Name", property: :last_name
    field :emailAddress, !types.String, "User's Email Address", property: :email_address
  end
