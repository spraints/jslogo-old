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

  parse = (code) ->
    try
      logo.parse code
    catch error
      $('<pre></pre>').text("" + error).appendTo(
        $('#output').empty()
      )
      null

  $('#go').click ->
    if program = parse($('#code').val())
      $('<code></code>').text(JSON.stringify(program)).appendTo($('#output'))
