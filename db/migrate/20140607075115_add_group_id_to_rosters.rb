class AddGroupIdToRosters < ActiveRecord::Migration
  def change
    add_reference :planned_rosters, :group, index: true
  end
end
