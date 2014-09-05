class AddFieldsToPage < ActiveRecord::Migration
  def up
    #add_column :pages, :title, :text, :default => '', :null => false
    add_column :pages, :content, :text, :default => '', :null => false
    add_column :pages, :name, :string, :default => '', :null => false
  end
  def down
    remove_column :pages, :title, :content, :name
  end
end
