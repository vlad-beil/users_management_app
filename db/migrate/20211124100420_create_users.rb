class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.text :about
      t.date :birthday
      t.text :img

      t.timestamps
    end
  end
end
