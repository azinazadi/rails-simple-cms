class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :from, :default => '', :null => false
      t.text :body, :default => '', :null => false

      t.timestamps
    end
  end
end
