class CreateRosters < ActiveRecord::Migration
  def change
    create_table :planned_rosters do |t|
      t.date :date
      t.text :team

      t.timestamps
    end
  end
end
