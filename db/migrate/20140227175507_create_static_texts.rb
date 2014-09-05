class CreateStaticTexts < ActiveRecord::Migration
  def change
    create_table :static_texts do |t|
      t.string :key, :null => false, :default => ''
      t.text :value, :null => false, :default => ''

      t.timestamps
    end
  end
end
