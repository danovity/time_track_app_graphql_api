class AddDeactivatedAtToUserShift < ActiveRecord::Migration[5.2]
  def change
    add_column :user_shifts, :deactivated_at, :datetime
  end
end
