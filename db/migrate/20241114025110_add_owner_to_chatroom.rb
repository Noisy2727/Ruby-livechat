class AddOwnerToChatroom < ActiveRecord::Migration[7.2]
  def change
    add_column :chatrooms, :owner, :string
  end
end
