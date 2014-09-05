class ModifyStaticText < ActiveRecord::Migration
  def up
    change_column :static_texts, :key, :string,   :null => false, :default => ''
    change_column :static_texts, :value, :text, :null => false, :default => ''
  end

  def down
  end
end
