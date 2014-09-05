#inline editor
window.ckeditor_config_master = {
  customConfig : ''
  toolbar_normal: [
    { name:"basicstyles", groups: [ "basicstyles", "cleanup" ], items: [ "ShowBlocks", "Format", "Bold", "", "RemoveFormat" ] }
    { name: "paragraph", items: [ "NumberedList", "BulletedList" ] }
    { name: "paragraph", items: ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ]  }
    { name: "links", items: [ "Link", "Unlink", "Anchor" ] }
    #    { name: "insert", items: [ "Image", "Slideshow" ] }
  ]

  toolbar_full : [
    #    { name: 'document',    groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source', 'Save', 'NewPage', 'DocProps', 'Preview', 'Print', 'Templates', 'document' ] }
    # On the basic preset, clipboard and undo is handled by keyboard.
    # Uncomment the following line to enable them on the toolbar as well.
    # { name: 'clipboard',   groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', 'Undo', 'Redo' ] },
#    { name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', 'SelectAll', 'Scayt' ] }
#    { name: 'insert', items: [ 'CreatePlaceholder', 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe', 'InsertPre' ] }
#    { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] }
#    '/'
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', 'RemoveFormat' ] }
    { name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align' ], items: [ 'NumberedList', 'BulletedList', 'Outdent', 'Indent', 'Blockquote', 'CreateDiv', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', 'BidiLtr', 'BidiRtl' ] }
    { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] }
    '/'
    { name: 'styles', items: [ 'ShowBlocks' , 'Format', 'Font', 'FontSize' ] }
    { name: 'colors', items: [ 'TextColor', 'BGColor' ] }
    { name: 'tools', items: [ 'UIColor', 'Maximize', ] }
  ]
  #
  #  stylesSets:  [
  #      { name: 'Strong Emphasis', element: 'strong' },
  #      { name: 'Emphasis', element: 'em' }
  #  ]

  format_tags : 'h1;h2;h3;p'
  font_names : 'Arial;Times New Roman;Verdana'
  allowedContent: true
  enterMode: CKEDITOR.ENTER_BR
  shiftEnterMode: CKEDITOR.ENTER_P

  #        autoGrow_bottomSpace : 100,
  #        autoGrow_maxHeight: 1000,
  #        autoGrow_onStartup: true,
  #        bodyClass: 'container',
  #        bodyId: 'ckeditor-editor',
  enableTabKeyTools: true
  entities: false
  forcePasteAsPlainText: true
  startupShowBorders: true
}
window.ckeditor_config_full_toolbar = window.ckeditor_config_master
window.ckeditor_config_full_toolbar['toolbar']='full'

window.ckeditor_config_normal_toolbar = window.ckeditor_config_master
window.ckeditor_config_normal_toolbar['toolbar']='normal'

formattedConfig = (formatNames) ->
