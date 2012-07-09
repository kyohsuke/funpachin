class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :detail, :null => false, :unique => true
    end
  end
end
