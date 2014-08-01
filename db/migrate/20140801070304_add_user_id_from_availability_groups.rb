class AddUserIdFromAvailabilityGroups < ActiveRecord::Migration
  def change
    add_column :availability_groups, :user_id, :integer
  end
end
