TypesUser::UserType =
  GraphQL::ObjectType.define do
    name 'User'
    description 'An User.'

    field :id, !types.ID
    field :firstName, !types.String, "User's First Name", property: :first_name
    field :lastName, !types.String, "User's Last Name", property: :last_name
    field :emailAddress, !types.String, "User's Email Address", property: :email_address

    field :currentShiftStatus, !TypesUserShift::UserShiftType, "User's Current Shift Status" do
      resolve ->(user, arguments, _context) do
        user_shift = UserShift.where(user_id: user.id).order("created_at").last
        user_shift
      end
    end

    connection :allShiftsStatus, !TypesUserShift::UserShiftType.connection_type, "A paginated list of the user's check-in check-out time" do
      resolve ->(user, arguments, _context) do
        UserShift.where(user_id: user.id).order("created_at")
      end
    end
  end
