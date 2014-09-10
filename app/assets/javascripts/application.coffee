#= require jquery
#/= require jquery_ujs
#/= require bootstrap

$ ->
  $('.navi a').click ->
    target = $(this).data('activate')
    $('.folie').removeClass('f-active')
    $(".folie.f-#{target}").addClass('f-active')
    $('.navi a').removeClass('n-active')
    $(this).addClass('n-active')