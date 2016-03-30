{EventEmitter2} = require 'eventemitter2'
debug           = require('debug')('meshblu-connector-say-hello:index')

class SayHello extends EventEmitter2
  constructor: (@device) ->
    debug 'SayHello constructed'

  onMessage: (message) =>
    debug 'onMessage', topic: message.topic
    return unless message.topic == 'greeting'

    debug 'saying hello...'
    @emit 'message', devices: ['*'], topic: 'response', payload: 'hello'

  onConfig: (config) =>
    debug 'on config'
    @device = config

  close: (callback) =>
    debug 'on close'
    callback()

module.exports = SayHello
