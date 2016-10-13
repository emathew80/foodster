class AlterCommentsAddColumns < ActiveRecord::Migration
  def change
    add_column :comments, :message, :text
    add_column :comments, :rating, :string


    add_column :comments, :user_id, :integer
    add_column :comments, :place_id, :integer


  end
end
