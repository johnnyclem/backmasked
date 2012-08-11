class AddAttachmentMp3ToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.has_attached_file :mp3
    end
  end

  def self.down
    drop_attached_file :uploads, :mp3
  end
end
