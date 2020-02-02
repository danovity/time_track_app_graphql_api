TypesUserShift::UserShiftType =
  GraphQL::ObjectType.define do
    name "UserShift"
    description "An User's Work Shifts."

    field :id,        !types.ID
    field :shiftActionType, !TypesUserShift::Enums::UserShiftActionTypeEnum, "Shift Action Type", property: :shift_action_type
    field :time,      !Types::DateType, "Shift Time", property: :created_at
    field :user, !TypesUser::UserType, "User Shift's User" do
      resolve ->(user_shift, _arguments, _context) do
        user_shift.user
      end
    end
  end
