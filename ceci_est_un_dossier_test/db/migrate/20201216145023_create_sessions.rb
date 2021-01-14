class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :course
      t.integer :week
      t.timestamps
    end
  end
end
