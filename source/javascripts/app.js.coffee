#= require 'jquery'
#= require 'logo'
#= require 'clogo'

$ ->
  $('#code').change ->
    # TODO -- find a better event (change only triggers on blur)
    # TODO -- store in localstorage (also, restore from it on page load!)

  $('#go').click ->
    try
      container = $ '<code></code>'
      container.text JSON.stringify(logo.parse($('#code').val()))
      $('#output').empty().append(container)
    catch error
      $('<pre></pre>').text("" + error).appendTo(
        $('#output').empty()
      )
