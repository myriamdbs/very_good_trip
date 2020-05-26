class ChangeDefaultForPackInItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :packed, :boolean, default: false
  end
end
