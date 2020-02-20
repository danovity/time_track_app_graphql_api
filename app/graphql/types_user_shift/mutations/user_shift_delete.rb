TypesUserShift::Mutations::UserShiftDelete = GraphQL::ObjectType.define do
  field :UserShiftDelete do
    type TypesUserShift::UserShiftType
    description "Delete an User's Clock-In or Clock-Out of a shift."

    argument :user_shift_id, !types.ID
    argument :user_id, !types.ID

    resolve ->(_object, arguments, _context) do
      user_shift = UserShift.find_by(id: arguments[:user_shift_id], user_id: arguments[:user_id])

      if user_shift.deactivated!
        user_shift
      else
        "UserShiftDelete Error"
      end
    end
  end
end
