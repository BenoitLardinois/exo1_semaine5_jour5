class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :bio
      t.integer :password
      t.integer :registration_number
      t.timestamps
    end
  end
end
