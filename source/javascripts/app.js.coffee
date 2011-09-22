#= require 'jquery'
#= require 'logo'

$ ->
  $('#go').click ->
    try
      container = $ '<code></code>'
      container.text JSON.stringify(logo.parse($('#code').val()))
      $('#output').empty().append(container)
    catch error
      $('#output').empty().text("" + error)
