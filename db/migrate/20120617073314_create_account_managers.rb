class CreateAccountManagers < ActiveRecord::Migration
  def change
    create_table :account_managers do |t|
      t.text :screen_name

      t.timestamps
    end
  end
end
