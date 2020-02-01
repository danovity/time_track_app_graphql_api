Types::DateType = GraphQL::ScalarType.define do
  name 'DateISO'
  description 'Date in UTC ISO8601 Format, example: 2018-03-27'

  coerce_input ->(value, _context) { Date.parse(String(value)) }
  coerce_result ->(value, _context) do
    begin
      value.iso8601
    rescue ArgumentError
      raise GraphQL::CoercionError, "cannot coerce `#{value.inspect}` to ISO8601 date"
    end
  end
end
