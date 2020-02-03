class AddClockedAtToUserShift < ActiveRecord::Migration[5.2]
  def change
    add_column :user_shifts, :clocked_at, :datetime
  end
end
