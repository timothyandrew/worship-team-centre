class AddTableTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.references :song_list, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
