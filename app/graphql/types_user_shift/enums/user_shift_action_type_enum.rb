TypesUserShift::Enums::UserShiftActionTypeEnum = GraphQL::EnumType.define do
  name        "UserShiftType"
  description "Describes the type of shift actions the user is doing."

  types = {
    "CLOCK_IN":     "When an user clock-in a shift",
    "CLOCK_OUT":    "When an user clock-out a shift"
  }
  UserShift::SHIFT_ACTION_TYPES.each do |type|
    value(type.to_s.upcase, types[type.to_sym], value: type.to_s)
  end
end
