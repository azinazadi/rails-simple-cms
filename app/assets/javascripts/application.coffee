#= require jquery
#= require jquery_ujs
#= require bootstrap

$ ->
  OSName="Unknown OS"
  OSName="Win" if (navigator.appVersion.indexOf("Win")!=-1)
  OSName="Mac"   if (navigator.appVersion.indexOf("Mac")!=-1)
  OSName="UNIX"    if (navigator.appVersion.indexOf("X11")!=-1)
  OSName="Lin"   if (navigator.appVersion.indexOf("Linux")!=-1)

  jscd = detect()
  referrer = if document.referrer!='' then  document.referrer else '-'
  $.get '/tik/visit' , { data: JSON.stringify(location: location.toString(), referrer: referrer, os: "#{jscd.os} #{jscd.osVersion}") }

  $('.contact-form').submit -> $('#myModal').modal('hide')
  $('.download-link').click ->
    $('#myModal').modal('show')
    $.get '/tik/download'

  $('.buy-link').click ->
    $.get '/tik/payment_clicked'

detect = () ->
  unknown = '-'
  # screen
  screenSize = ''
  if screen.width
    width = if screen.width then screen.width else ''
    height = if screen.height then screen.height else ''
    screenSize += '' + width + ' x ' + height
  #browser
  nVer = navigator.appVersion
  nAgt = navigator.userAgent
  browser = navigator.appName
  version = '' + parseFloat(navigator.appVersion)
  majorVersion = parseInt(navigator.appVersion, 10)
  nameOffset = undefined
  verOffset = undefined
  ix = undefined
  # Opera
  if (verOffset = nAgt.indexOf('Opera')) != -1
    browser = 'Opera'
    version = nAgt.substring(verOffset + 6)
    if (verOffset = nAgt.indexOf('Version')) != -1
      version = nAgt.substring(verOffset + 8)
  else if (verOffset = nAgt.indexOf('MSIE')) != -1
    browser = 'Microsoft Internet Explorer'
    version = nAgt.substring(verOffset + 5)
  else if (verOffset = nAgt.indexOf('Chrome')) != -1
    browser = 'Chrome'
    version = nAgt.substring(verOffset + 7)
  else if (verOffset = nAgt.indexOf('Safari')) != -1
    browser = 'Safari'
    version = nAgt.substring(verOffset + 7)
    if (verOffset = nAgt.indexOf('Version')) != -1
      version = nAgt.substring(verOffset + 8)
  else if (verOffset = nAgt.indexOf('Firefox')) != -1
    browser = 'Firefox'
    version = nAgt.substring(verOffset + 8)
  else if nAgt.indexOf('Trident/') != -1
    browser = 'Microsoft Internet Explorer'
    version = nAgt.substring(nAgt.indexOf('rv:') + 3)
  else if (nameOffset = nAgt.lastIndexOf(' ') + 1) < (verOffset = nAgt.lastIndexOf('/'))
    browser = nAgt.substring(nameOffset, verOffset)
    version = nAgt.substring(verOffset + 1)
    if browser.toLowerCase() == browser.toUpperCase()
      browser = navigator.appName
  # trim the version string
  if (ix = version.indexOf(';')) != -1
    version = version.substring(0, ix)
  if (ix = version.indexOf(' ')) != -1
    version = version.substring(0, ix)
  if (ix = version.indexOf(')')) != -1
    version = version.substring(0, ix)
  majorVersion = parseInt('' + version, 10)
  if isNaN(majorVersion)
    version = '' + parseFloat(navigator.appVersion)
    majorVersion = parseInt(navigator.appVersion, 10)
  # mobile version
  mobile = /Mobile|mini|Fennec|Android|iP(ad|od|hone)/.test(nVer)
  # cookie
  cookieEnabled = if navigator.cookieEnabled then true else false
  if typeof navigator.cookieEnabled == 'undefined' and !cookieEnabled
    document.cookie = 'testcookie'
    cookieEnabled = if document.cookie.indexOf('testcookie') != -1 then true else false
  # system
  os = unknown
  clientStrings = [
    {
      s: 'Windows 7'
      r: /(Windows 7|Windows NT 6.1)/
    }
    {
      s: 'Windows 8.1'
      r: /(Windows 8.1|Windows NT 6.3)/
    }
    {
      s: 'Windows 8'
      r: /(Windows 8|Windows NT 6.2)/
    }
    {
      s: 'Android'
      r: /Android/
    }
    {
      s: 'Open BSD'
      r: /OpenBSD/
    }
    {
      s: 'Sun OS'
      r: /SunOS/
    }
    {
      s: 'Linux'
      r: /(Linux|X11)/
    }
    {
      s: 'iOS'
      r: /(iPhone|iPad|iPod)/
    }
    {
      s: 'Mac OS X'
      r: /Mac OS X/
    }
    {
      s: 'Mac OS'
      r: /(MacPPC|MacIntel|Mac_PowerPC|Macintosh)/
    }
    {
      s: 'QNX'
      r: /QNX/
    }
    {
      s: 'UNIX'
      r: /UNIX/
    }
    {
      s: 'BeOS'
      r: /BeOS/
    }
    {
      s: 'OS/2'
      r: /OS\/2/
    }
    {
      s: 'Search Bot'
      r: /(nuhk|Googlebot|Yammybot|Openbot|Slurp|MSNBot|Ask Jeeves\/Teoma|ia_archiver)/
    }
  ]
  for id of clientStrings
    cs = clientStrings[id]
    if cs.r.test(nAgt)
      os = cs.s
      break
  osVersion = unknown
  if /Windows/.test(os)
    osVersion = /Windows (.*)/.exec(os)[1]
    os = 'Windows'
  switch os
    when 'Mac OS X'
      osVersion = /Mac OS X (10[\.\_\d]+)/.exec(nAgt)[1]
    when 'Android'
      osVersion = /Android ([\.\_\d]+)/.exec(nAgt)[1]
    when 'iOS'
      osVersion = /OS (\d+)_(\d+)_?(\d+)?/.exec(nVer)
      osVersion = osVersion[1] + '.' + osVersion[2] + '.' + (osVersion[3] | 0)
  # flash (you'll need to include swfobject)

  ### script src="//ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js" ###

  flashVersion = 'no check'
  if typeof swfobject != 'undefined'
    fv = swfobject.getFlashPlayerVersion()
    if fv.major > 0
      flashVersion = fv.major + '.' + fv.minor + ' r' + fv.release
    else
      flashVersion = unknown
  window.jscd =
    screen: screenSize
    browser: browser
    browserVersion: version
    mobile: mobile
    os: os
    osVersion: osVersion
    cookies: cookieEnabled
    flashVersion: flashVersion
  return jscd
#  alert 'OS: ' + jscd.os + ' ' + jscd.osVersion + '\n' + 'Browser: ' + jscd.browser + ' ' + jscd.browserVersion + '\n' + 'Mobile: ' + jscd.mobile + '\n' + 'Flash: ' + jscd.flashVersion + '\n' + 'Cookies: ' + jscd.cookies + '\n' + 'Screen Size: ' + jscd.screen

