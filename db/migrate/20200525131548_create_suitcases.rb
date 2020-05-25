class CreateSuitcases < ActiveRecord::Migration[6.0]
  def change
    create_table :suitcases do |t|
      t.string :name
      t.string :destination
      t.boolean :shared
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
