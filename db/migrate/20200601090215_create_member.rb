class CreateMember < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.references :user, foreign_key: true
      t.references :suitcase, foreign_key: true
    end
  end
end
