Types::MutationType =
  GraphQL::ObjectType.define do
    name 'Mutation'

    fields GraphQLUtils::FieldCombiner.combine(
      [
        TypesUserShift::Mutations::UserShiftCreate,
        TypesUserShift::Mutations::UserShiftEdit,
        TypesUserShift::Mutations::UserShiftDelete,
        TypesUser::Mutations::UserCreate
      ])
  end
