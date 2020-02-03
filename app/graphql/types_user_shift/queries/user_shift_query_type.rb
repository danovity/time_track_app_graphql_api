TypesUserShift::Queries::UserShiftQueryType = GraphQL::ObjectType.define do
  field :userShift, TypesUserShift::UserShiftType, "A paginated list of the user's check-in check-out time" do
    argument :id, types.ID

    resolve ->(_object, arguments, _context) do
      if user_id
        UserShift.find(arguments[:id])
      end
    end
  end
end
