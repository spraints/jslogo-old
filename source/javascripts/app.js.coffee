#= require 'jquery'
#= require 'logo'
#= require 'clogo'
#= require 'modernizr'

$ ->
  if Modernizr.localstorage
    if $('#code').val() == ''
      $('#code').val(window.localStorage.getItem('code'))
    $('#code').change ->
      # TODO -- find a better event (change only triggers on blur)
      window.localStorage.setItem('code', $(this).val())

  $('#go').click ->
    try
      container = $ '<code></code>'
      container.text JSON.stringify(logo.parse($('#code').val()))
      $('#output').empty().append(container)
    catch error
      $('<pre></pre>').text("" + error).appendTo(
        $('#output').empty()
      )
