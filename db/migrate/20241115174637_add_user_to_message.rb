class AddUserToMessage < ActiveRecord::Migration[7.2]
  def change
    add_column :messages, :Messages, :string
  end
end
