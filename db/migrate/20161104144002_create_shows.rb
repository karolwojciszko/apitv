class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.references :channel, foreign_key: true

      t.timestamps
    end
  end
end
