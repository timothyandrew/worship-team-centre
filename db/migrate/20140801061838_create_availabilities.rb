class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.references :user, index: true
      t.references :availability_group, index: true
      t.date :date
      t.string :service

      t.timestamps
    end
  end
end
