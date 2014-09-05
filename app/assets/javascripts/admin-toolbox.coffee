#= require rich
#= require ckeditor_configs/ckeditor-configs


$ ->
  closeEditors = ->
    $('.editable').removeAttr('contenteditable')
    for ins, val of CKEDITOR.instances
      val.destroy(false)


  CKEDITOR.config.stylesSet = false
  $('.toc-switch').click ->
    $(this).closest('.toggle-on-click').toggleClass 'is-off'

  CKEDITOR.disableAutoInline = true;


  # disable links and forms, so that we can edit them
  $(document).on 'click', 'body.admin-editable a:not(.admin-action) , body.admin-editable label', (event) ->
    event.preventDefault()
    return false
  $('a:not(.admin-action)').click (event) ->
    if $('body').hasClass('admin-editable')
      event.preventDefault()
      return false

  $('.at-edit').click ->
    $('body').addClass('admin-editable')
    $('.editable').attr('contenteditable', "true")

  $(document).on 'click', 'body.admin-editable .editable[data-editor-type="text"]', ->
    CKEDITOR.inline this, window.ckeditor_config_normal_toolbar

  $(document).on 'click', 'body.admin-editable .editable[data-editor-type="text_with_full_editor"]', ->
    CKEDITOR.inline this, window.ckeditor_config_full_toolbar

  $('.at-cancel').click ->
    $('body').removeClass('admin-editable')
    closeEditors()
    #revert the unsaved editors
    $('.editable-root:not(.is-saved) .editable').each -> $(this).html($(this).data('original'))

  $('.at-save').click ->
    $('body').removeClass('admin-editable')
    closeEditors()

    #gather list of changes elements
    changed = $('.editable-root').filter( ->
      $(this).find('.editable').filter( ->
        $(this).data('original') != $(this).html()
      ).size() > 0
    )
    #submit data to server
    changed.each -> updateResource($(this))


  updateResource = (editableRoot) ->
    editableRoot = $(editableRoot)
    editableRoot.addClass('is-saving')

    data =
      "utf8": "✓"
      "resource_class" : editableRoot.data('class')
      "resource_id" : editableRoot.data('id')
      "action": "update"
      "resource" : collectData(editableRoot)

    $.ajax
      type: "POST",
      url: editableRoot.data('path')
      data: data
      success: (retData) ->
        if retData == 'success'
          editableRoot.removeClass('is-saving').addClass('is-saved')
        else
          console.log retData
          editableRoot.removeClass('is-saving').addClass('is-error')


  collectData = (editableRoot) ->
    ret = {}
    clientSideIdentifier = $(editableRoot).data('client-side-identifier')
    $(editableRoot).find(".editable[data-client-side-root='#{clientSideIdentifier}']").each ->
      ret[$(this).data('attr')] = $(this).html()
      return true
    ret


