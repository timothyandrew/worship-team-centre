class CreatePlannedRosterGroups < ActiveRecord::Migration
  def change
    create_table :planned_roster_groups do |t|
      t.date :month

      t.timestamps
    end
  end
end
