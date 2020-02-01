Types::MutationType =
  GraphQL::ObjectType.define do
    name 'Mutation'

    fields GraphQLUtils::FieldCombiner.combine(
      [
        TypesUserShift::Mutations::UserShiftCreate,
        TypesUser::Mutations::UserCreate
      ])
  end
