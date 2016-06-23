class RenameTypeToFileTypeInPhotos < ActiveRecord::Migration
  def change
    rename_column :photos, :type, :file_type
  end
end
