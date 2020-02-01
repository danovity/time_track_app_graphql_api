class CreateUserShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_shifts do |t|
      t.integer   :user_id
      t.string    :shift_action_type

      t.timestamps
    end
  end
end
