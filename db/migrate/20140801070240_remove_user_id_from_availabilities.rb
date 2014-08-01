class RemoveUserIdFromAvailabilities < ActiveRecord::Migration
  def change
    remove_column :availabilities, :user_id
  end
end
