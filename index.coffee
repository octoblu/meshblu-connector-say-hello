{EventEmitter2} = require 'eventemitter2'
debug           = require('debug')('meshblu-connector-say-hello:index')

class SayHello extends EventEmitter2
  constructor: () ->
    debug 'SayHello constructed'

  isOnline: (callback) =>
    callback null, running: true

  close: (callback) =>
    debug 'on close'
    callback()

  onMessage: (message) =>
    debug 'on message', message
    { topic, devices, fromUuid } = message
    return if '*' in devices
    return if topic == 'response'
    fromUuid = '*' if fromUuid == @uuid
    debug "saying #{@response} to #{fromUuid}..."
    @emit 'message', devices: [fromUuid], topic: 'response', payload: @response

  onConfig: (device) =>
    debug 'on config'
    @_setResponse device

  start: (device) =>
    debug 'started'
    { @uuid } = device
    @_setResponse device

  _setResponse: (device) =>
    response = device?.options?.response
    @response = response ? 'hello'

module.exports = SayHello
