class Command
  constructor: (@name, @args) ->

window.Logo =
  buildCommand: (name, args...) -> new Command(name, args)
