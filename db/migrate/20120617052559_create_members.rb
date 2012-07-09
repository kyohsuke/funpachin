class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :name
      t.references :status
      t.text :twitter
      t.text :other

      t.timestamps
    end
    add_index :members, :status_id
  end
end
