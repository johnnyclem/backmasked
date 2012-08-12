class RemoveColumnsFromUploads < ActiveRecord::Migration
  def change
    remove_column :uploads, :file_name 
    remove_column :uploads, :file_type
    remove_column :uploads, :file_size
  end
end
