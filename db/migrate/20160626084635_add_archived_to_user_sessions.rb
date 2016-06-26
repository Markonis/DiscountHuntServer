class AddArchivedToUserSessions < ActiveRecord::Migration
  def change
    add_column :user_sessions, :archived, :boolean, default: false
  end
end
