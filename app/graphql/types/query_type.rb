Types::QueryType =
  GraphQL::ObjectType.define do
    name 'Query'

    fields GraphQLUtils::FieldCombiner.combine(
      [
        TypesUser::Queries::UserQueryType,
        TypesUserShift::Queries::UserShiftQueryType
      ])
  end
