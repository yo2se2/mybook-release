class AddDetailsToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :title, :string
  end
end
