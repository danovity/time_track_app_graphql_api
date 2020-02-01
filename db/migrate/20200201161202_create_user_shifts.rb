class CreateUserShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_shifts do |t|
      t.timestamp :check_in_time
      t.timestamp :check_out_time
      t.integer   :user_id

      t.timestamps
    end
  end
end
