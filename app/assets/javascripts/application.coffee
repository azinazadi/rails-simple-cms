#= require jquery
#= require jquery_ujs
#= require fitVids
#= require bootstrap

$ ->
  $('html, body').scrollTop($('#vid').height()/2);

  $('.fitvids').fitVids()

  $('.contact-form').submit -> $('#myModal').modal('hide')
  $('.download-link').click -> $('#myModal').modal('show')
