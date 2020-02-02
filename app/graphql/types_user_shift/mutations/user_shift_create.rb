TypesUserShift::Mutations::UserShiftCreate = GraphQL::ObjectType.define do
  field :UserShiftCreate do
    type TypesUserShift::UserShiftType
    description 'User Clock-In or Clock-Out of a shift.'

    argument :shift_action_type, !TypesUserShift::Enums::UserShiftActionTypeEnum
    argument :emailAddress, !types.String

    resolve ->(_object, arguments, _context) do
      shift_action_type = arguments[:shift_action_type]
      emailAddress = arguments[:emailAddress]
      user = User.find_by(email_address: emailAddress)

      user_shift = UserShift.new(user_id: user.id, shift_action_type: shift_action_type)

      if user_shift.save
        user_shift
      else
        "UserShiftCreate Error"
      end
    end
  end
end
