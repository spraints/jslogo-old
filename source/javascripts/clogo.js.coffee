class Command
  constructor: (@name, @args) ->

class Loop
  constructor: (@name, @arg, @commands) ->

window.Logo =
  buildCommand: (name, args...) -> new Command(name, args)
  buildLoop:    (name, arg, commands) -> new Loop(name, arg, commands)
