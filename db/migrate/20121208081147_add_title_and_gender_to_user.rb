class AddTitleAndGenderToUser < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :gender, :char
  end
end
