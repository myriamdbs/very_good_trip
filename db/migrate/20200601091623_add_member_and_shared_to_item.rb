class AddMemberAndSharedToItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :member, foreign_key: true
    add_column :items, :shared, :boolean
  end
end
