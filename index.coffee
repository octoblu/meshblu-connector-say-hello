{EventEmitter2} = require 'eventemitter2'

class SayHello extends EventEmitter2
  constructor: (@device) ->

  onMessage: (message) =>
    @emit 'message', devices: ['*'], topic: 'greeting', payload: 'hello'

  onConfig: (config) =>
    @device = config
    @emit 'message', devices: ['*'],  topic: 'greeting', payload: 'howdy'

  close: (callback) =>
    callback()

module.exports = SayHello
