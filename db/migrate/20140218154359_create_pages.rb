class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, :default => '', :null => false
      t.string :image, :default => '', :null => false
      t.text :content, :default => '', :null => false
      t.string :slug, :default => '', :null => false
      t.timestamps
    end
  end
end
