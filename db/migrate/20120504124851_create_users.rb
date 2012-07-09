class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|

      # Omni Auth Twitter
      t.string :provider, :null => false, :limit => 7
      t.integer :uid, :null => false, :limit => 8
      t.string :screen_name, :null => false, :uniq => true

      t.timestamps
    end

    add_index :users, [:provider, :uid], :unique => true
    add_index :users, [:screen_name]
  end

  def self.down
    drop_table :users
  end
end
