class Command
  constructor: (@name, @args) ->

class Loop
  constructor: (@name, @commands) ->

window.Logo =
  buildCommand: (name, args...) -> new Command(name, args)
  buildLoop:    (name, commands) -> new Loop(name, commands)
