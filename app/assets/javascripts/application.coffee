#= require jquery
#= require jquery_ujs
#= require bootstrap

$ ->
  OSName="Unknown OS"
  OSName="Win" if (navigator.appVersion.indexOf("Win")!=-1)
  OSName="Mac"   if (navigator.appVersion.indexOf("Mac")!=-1)
  OSName="UNIX"    if (navigator.appVersion.indexOf("X11")!=-1)
  OSName="Lin"   if (navigator.appVersion.indexOf("Linux")!=-1)

  referrer = if document.referrer!='' then  document.referrer else '-'
  $.get '/tik/visit' , { data: "referrer: #{referrer}, os: #{OSName}" }

  $('.contact-form').submit -> $('#myModal').modal('hide')
  $('.download-link').click ->
    $('#myModal').modal('show')
    $.get '/tik/download'
