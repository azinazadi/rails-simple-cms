class TrailerInput < Formtastic::Inputs::TextInput

  def options
    super.merge :hint => object.trailer.html_safe
  end
end
