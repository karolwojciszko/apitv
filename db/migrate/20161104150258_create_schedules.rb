class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :show, foreign_key: true
      t.datetime :start
      t.datetime :stop

      t.timestamps
    end
  end
end
