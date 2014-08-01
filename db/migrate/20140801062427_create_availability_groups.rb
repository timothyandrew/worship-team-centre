class CreateAvailabilityGroups < ActiveRecord::Migration
  def change
    create_table :availability_groups do |t|
      t.date :month

      t.timestamps
    end
  end
end
