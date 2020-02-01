TypesUserShift::Queries::UserShiftQueryType = GraphQL::ObjectType.define do
  connection :userShifts, TypesUserShift::UserShiftType.connection_type, "A paginated list of the user's check-in check-out time" do

    argument :id, types.ID

    resolve ->(_object, arguments, _context) do
      user_id = arguments[:id]

      if user_id
        UserShift.where(user_id: user_id)
      end
    end
  end
end
