module.exports =
  title: 'SayHello'
  type: 'object'
  properties:
    data:
      type: 'object'
      properties:
        response:
          type: 'string'
      required: [
        'response'
      ]