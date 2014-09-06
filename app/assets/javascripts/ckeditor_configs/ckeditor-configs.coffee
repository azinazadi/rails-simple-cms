#inline editor
window.ckeditor_config_master = {
  customConfig : ''
  toolbar_minimal: [
    { name: 'clipboard',    items: [ 'Undo', 'Redo' ] },
    { name:"basicstyles",   items: [ "Format", "Bold", "", "RemoveFormat" ] }
    { name: "paragraph",    items: [ "NumberedList", "BulletedList" ] }
    { name: "links",        items: [ "Link", "Unlink" ] }
  ]

  toolbar_normal: [
    { name: 'clipboard',    items: [ 'Undo', 'Redo' ] },
    { name: "insert",       items: [ "Image" ] }
    { name:"basicstyles",   items: [ "ShowBlocks", "Format", "Bold", "", "RemoveFormat" ] }
    { name: "paragraph",    items: [ "NumberedList", "BulletedList" ] }
    { name: "paragraph",    items: ['JustifyLeft','JustifyCenter' ]  }
    { name: "links",        items: [ "Link", "Unlink", "Anchor" ] }
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
    { name: 'clipboard',  items: [ 'Undo', 'Redo' ] },
    { name: 'insert', items: [  'Image', 'Table', 'HorizontalRule', 'SpecialChar', 'PageBreak', 'Iframe' ] }
    { name: 'basicstyles',  items: [ 'Bold', 'Italic', 'Underline', 'RemoveFormat' ] }
    { name: 'paragraph',  items: [ 'NumberedList', 'BulletedList', 'Outdent', 'Indent', 'Blockquote', 'CreateDiv', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] }
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


window.ckeditor_configs={}
window.ckeditor_configs['full'] = $.extend({},window.ckeditor_config_master)
window.ckeditor_configs['full']['toolbar']='full'

window.ckeditor_configs['normal'] = $.extend({},window.ckeditor_config_master)
window.ckeditor_configs['normal']['toolbar']='normal'

window.ckeditor_configs['minimal'] = $.extend({},window.ckeditor_config_master)
window.ckeditor_configs['minimal']['toolbar']='minimal'

