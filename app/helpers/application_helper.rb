module ApplicationHelper

  def editable_root resource
    if can? :edit, resource
      {:class => 'editable-root', 'data-class' => resource.class.name, 'data-id' => resource.id, 'data-client-side-identifier' => "#{resource.class.name}##{resource.id}", 'data-path' => inplace_update_url}
    else
      {}
    end
  end

  def editable resource, field, editor_type=:string, editor=nil
    if can? :edit, resource
      {:class => 'editable', 'data-attr' => field, 'data-client-side-root' => "#{resource.class.name}##{resource.id}", 'data-original' => resource.try(field), 'data-editor-type' => editor_type, 'data-editor' => editor }
    else
      {}
    end
  end

  # returns the static text that is stored in the library for the given key
  # if the user can edit it, its' gonna be editable
  def st key, type=:string, editor=:normal, &block
    st = StaticText.find_by_key(key) || StaticText.create(key: key)
    val = st.value.presence || (capture &block if block) || "#{key}...".tr('_', ' ')
    if can? :edit, st
      tag = (type==:string ? :span : :div)
      content_tag tag, editable_root(st) do
        content_tag tag, editable(st, :value, type, editor) do
          val.html_safe
        end
      end
    else
      val
    end.html_safe
  end

end
