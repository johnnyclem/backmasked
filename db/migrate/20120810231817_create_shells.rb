class CreateShells < ActiveRecord::Migration
  def change
    create_table :shells do |t|

      t.timestamps
    end
  end
end
