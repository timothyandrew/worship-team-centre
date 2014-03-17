class AddUserIdToWorshipSet < ActiveRecord::Migration
  def change
    add_column :song_lists, :leader_id, :integer
  end
end
