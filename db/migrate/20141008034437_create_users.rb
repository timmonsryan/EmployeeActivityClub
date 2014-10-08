class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :tellerNumber
      t.string :firstName
      t.string :lastName
      t.string :department
      t.boolean :admin

      t.timestamps
    end
  end
end
