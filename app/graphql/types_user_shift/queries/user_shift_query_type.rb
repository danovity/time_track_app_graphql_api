TypesUserShift::Queries::UserShiftQueryType = GraphQL::ObjectType.define do
  field :userShift, TypesUserShift::UserShiftType, "An user's clock-in or clock-out time" do
    argument :id, types.ID

    resolve ->(_object, arguments, _context) do
      UserShift.find(arguments[:id])
    end
  end
end
