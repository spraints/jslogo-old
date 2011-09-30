#= require 'jquery'
#= require 'logo'
#= require 'clogo'

$ ->
  $('#go').click ->
    try
      container = $ '<code></code>'
      container.text JSON.stringify(logo.parse($('#code').val()))
      $('#output').empty().append(container)
    catch error
      $('<pre></pre>').text("" + error).appendTo(
        $('#output').empty()
      )
