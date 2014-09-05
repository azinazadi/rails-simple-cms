# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.boolean_style = :nested

  #config.wrappers :bootstrap3, tag: 'div', class: 'form-group', error_class: 'has-error',
  #                defaults: {input_html: {class: 'default_class'}} do |b|
  #
  #  b.use :html5
  #  b.use :min_max
  #  b.use :maxlength
  #  b.use :placeholder
  #
  #  b.optional :pattern
  #  b.optional :readonly
  #
  #  b.use :label_input
  #  b.use :hint, wrap_with: {tag: 'span', class: 'help-block'}
  #  b.use :error, wrap_with: {tag: 'span', class: 'help-block has-error'}
  #end
  #
  #config.wrappers :prepend, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
  #  b.use :html5
  #  b.use :placeholder
  #  b.wrapper tag: 'div', class: 'controls' do |input|
  #    input.wrapper tag: 'div', class: 'input-group' do |prepend|
  #      prepend.use :label, class: 'input-group-addon' ###Please note setting class here fro the label does not currently work (let me know if you know a workaround as this is the final hurdle)
  #      prepend.use :input
  #    end
  #    input.use :hint, wrap_with: {tag: 'span', class: 'help-block'}
  #    input.use :error, wrap_with: {tag: 'span', class: 'help-block has-error'}
  #  end
  #end
  #
  #config.wrappers :append, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
  #  b.use :html5
  #  b.use :placeholder
  #  b.wrapper tag: 'div', class: 'controls' do |input|
  #    input.wrapper tag: 'div', class: 'input-group' do |prepend|
  #      prepend.use :input
  #      prepend.use :label, class: 'input-group-addon' ###Please note setting class here fro the label does not currently work (let me know if you know a workaround as this is the final hurdle)
  #    end
  #    input.use :hint, wrap_with: {tag: 'span', class: 'help-block'}
  #    input.use :error, wrap_with: {tag: 'span', class: 'help-block has-error'}
  #  end
  #end
  #

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com/)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap3_horizontal


  config.wrappers :bootstrap3_horizontal, tag: 'div', class: 'form-group', error_class: 'has-error',
                  defaults: {input_html: {class: 'form-group default_class'}} do |b|

    b.use :html5
    b.use :min_max
    b.use :maxlength
    b.use :placeholder

    b.optional :pattern
    b.optional :readonly

    b.use :label, class: 'col-sm-3'

    b.wrapper tag: 'div', class: 'col-sm-9' do |input_block|
      input_block.use :input
      input_block.use :hint, wrap_with: {tag: 'span', class: 'help-block'}
    end
    b.use :error, wrap_with: {tag: 'span', class: 'help-block has-error'}
  end


  config.wrappers :inline_checkbox, tag: :div, class: "checkbox checkbox-inline", error_class: "has-error" do |b|

    # Form extensions
    b.use :html5

    # Form components
    #b.wrapper tag: :label do |ba|
    #  ba.use :input
    #  ba.use :label_text
    #end
    #b.use :label, class: 'col-sm-4 control-label'

    b.wrapper tag: :label, class: '' do |ba|
      ba.use :input
      ba.use :label_text
    end

    b.use :hint, wrap_with: {tag: :p, class: "help-block"}
    b.use :error, wrap_with: {tag: :span, class: "help-block text-danger"}
  end


  config.wrappers :checkbox, tag: :div, class: "checkbox", error_class: "has-error" do |b|

    # Form extensions
    b.use :html5

    # Form components
    #b.wrapper tag: :label do |ba|
    #  ba.use :input
    #  ba.use :label_text
    #end
    #b.use :label, class: 'col-sm-3 control-label'
    b.wrapper tag: 'div', class: 'col-sm-3' do
    end

    b.use :label, tag: 'div', class: 'col-sm-9' do |ba|
      ba.use :label_input
      #ba.use :label_text
    end

    b.use :hint, wrap_with: {tag: :p, class: "help-block"}
    b.use :error, wrap_with: {tag: :span, class: "help-block text-danger"}
  end

end

# Use this setup block to configure all options available in SimpleForm.

module SimpleForm::Components::Labels

  def label_text
    rlt = raw_label_text
    if rlt.include? '||'
      rlt = "<div class='vlist'>#{rlt.split('||').map { |s| "<span>#{s}</span>" }.join}</div>".html_safe
    end
    SimpleForm.label_text.call(html_escape(rlt), required_label_text).strip.html_safe
  end
end


module SimpleForm
  module Components
    module Pattern
      def pattern
        # Deactivated for good:
        #input_html_options[:pattern] ||= pattern_source
        nil
      end
    end
  end
end