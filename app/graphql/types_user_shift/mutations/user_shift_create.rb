TypesUserShift::Mutations::UserShiftCreate = GraphQL::ObjectType.define do
  field :UserShiftCreate do
    type TypesUserShift::UserShiftType
    description 'User Clock-In or Clock-Out of a shift.'

    argument :shiftActionType, !TypesUserShift::Enums::UserShiftActionTypeEnum
    argument :id, !types.ID

    resolve ->(_object, arguments, _context) do
      shift_action_type = arguments[:shiftActionType]
      user = User.find(arguments[:id])

      user_shift = UserShift.new(user_id: user.id, shift_action_type: shift_action_type)

      if user_shift.save
        user_shift.order(:created_at)
      else
        "UserShiftCreate Error"
      end
    end
  end
end
