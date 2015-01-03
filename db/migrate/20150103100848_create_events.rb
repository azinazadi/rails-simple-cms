class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :ip,     null: false
      t.string :what  , null: false
      # t.datetime :time, null: false

      t.timestamps
    end
  end
end
