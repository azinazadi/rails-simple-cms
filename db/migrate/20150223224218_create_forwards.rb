class CreateForwards < ActiveRecord::Migration
  def change
    create_table :forwards do |t|
      t.string :slug, null: false, default: ''
      t.string :url, null: false, default: ''

      t.timestamps
    end
  end
end
