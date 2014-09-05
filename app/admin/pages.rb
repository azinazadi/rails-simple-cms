ActiveAdmin.register Page do
  form do |f|
    f.inputs do
      f.input :name if  f.object.new_record?
      f.input :title, :as => :string
      #f.input :content, :as => :rich_picker, :config => { :style => 'width: 400px !important;' }
      f.input :content, :as => :rich, :config => {:width => '76%', :height => '400px'}
    end
    f.buttons
  end

  index do
     column :title
     column :name
     default_actions
   end

end
