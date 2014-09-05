class ImageInput < Formtastic::Inputs::FileInput

  def options
    super.merge :as => :file,  :hint => "<img src='#{object.image.url(:medium)}' />".html_safe
  end

end