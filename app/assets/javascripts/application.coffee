#= require jquery
#/= require jquery_ujs
#/= require bootstrap

navigateTo = (target) ->
  $('.folie').removeClass('f-active')
  $(".folie.f-#{target}").addClass('f-active')
  $('.navi a').removeClass('n-active')
  $("a[data-activate='#{target}']").addClass('n-active')
  history.pushState({}, '', "/##{target}")
  $('body').attr('data-current-folie', target)


$ ->
  folien=[
    'start'
    'artful-walks'
    'about-us'
    'ariane'
    'norbert'
    'contact-us'
    'guest-book'
    'site-notice'
    'see-you-soon'
  ]
  nextFolie = {}
  nextFolie[cur]=folien[(i+1) % folien.length] for cur,i in folien

  navigateTo(target) if (target=window.location.hash.substr(1)).length > 0
  $('.navi a').click ->
    target = ($ this).data 'activate'
    navigateTo target

  # next folie on click
  $('.folie').click (event) -> navigateTo(nextFolie[$(this).data('id')]) unless event.target.tagName.toUpperCase() in ['INPUT', 'TEXTAREA', 'A', 'BUTTON']