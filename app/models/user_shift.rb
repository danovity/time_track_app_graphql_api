class UserShift < ApplicationRecord
  SHIFT_ACTION_TYPES = [
    "clock_in",
    "clock_out"
  ].freeze

  belongs_to :user
  validates :shift_action_type, :inclusion => {:in => SHIFT_ACTION_TYPES}

  date_flag :deactivated_at
  date_flag :clocked_at

  scope :active, -> {
    where('deactivated_at IS NULL')
  }
end
