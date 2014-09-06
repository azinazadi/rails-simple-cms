ActiveAdmin.register Page do
  form do |f|
    f.inputs do
      f.input :title, :as => :string
      f.input :slug
      f.input :content, :as => :rich, :config => {:width => '76%', :height => '400px'}
    end
    f.actions
  end

  index do
    column :slug
    column :title
    actions
  end

end
