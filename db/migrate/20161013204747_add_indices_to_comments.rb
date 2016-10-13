class AddIndicesToComments < ActiveRecord::Migration
  def change
    add_index :comments, [:user_id, :place_id]
    add_index :comments, :place_id
  end
end
