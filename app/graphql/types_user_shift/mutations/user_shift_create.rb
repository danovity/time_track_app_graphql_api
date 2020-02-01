TypesUserShift::Mutations::UserShiftCreate = GraphQL::ObjectType.define do
  field :UserShiftCreate do
    type TypesUserShift::UserShiftType
    description 'User Clock-In or Clock-Out of a shift.'

    argument :shift_action_type, !TypesUserShift::Enums::UserShiftActionTypeEnum
    argument :user_id, !types.ID

    resolve ->(_object, arguments, _context) do
      shift_action_type = arguments[:shift_action_type]
      user_id = arguments[:user_id]

      user_shift = UserShift.new(user_id: user_id, shift_action_type: shift_action_type)

      if user_shift.save
        user_shift
      else
        "UserShiftCreate Error"
      end
    end
  end
end
