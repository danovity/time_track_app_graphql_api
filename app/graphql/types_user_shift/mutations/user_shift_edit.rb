TypesUserShift::Mutations::UserShiftEdit= GraphQL::ObjectType.define do
  field :UserShiftEdit do
    type TypesUserShift::UserShiftType
    description "Edit an User's Clock-In or Clock-Out of a shift."

    argument :user_shift_id, !types.ID
    argument :user_id, !types.ID
    argument :clocked_at, !types.String

    resolve ->(_object, arguments, _context) do
      user_shift = UserShift.active.find_by(id: arguments[:user_shift_id], user_id: arguments[:user_id])
      user_shift.clocked_at = arguments[:clocked_at].to_time

      if user_shift.save!
        user_shift
      else
        "UserShiftEdit Error"
      end
    end
  end
end
