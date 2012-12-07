class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :father_name
      t.integer :profession_id
      t.text :address

      t.timestamps
    end
  end
end
