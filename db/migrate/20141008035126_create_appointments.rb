class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.boolean :attended

      t.timestamps
    end
  end
end
