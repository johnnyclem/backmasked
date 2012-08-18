class AddAlbumtoMp3Data < ActiveRecord::Migration
  def up
  	add_column :mp3data, :album, :string
  end

  def down
  	remove_column :mp3data, :album
  end
end
