class CreateMp3data < ActiveRecord::Migration
  def change
    create_table :mp3data do |t|
      t.string :artist
      t.string :song
      t.integer :count
      t.timestamp :date

      t.timestamps
    end
  end
end
