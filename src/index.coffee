'use strict'
debug = require('debug')('loopback:component:current-user')
currentUser = require('./middleware/current-user')

module.exports = (app, options) ->
  debug 'initializing component'
  loopback = app.loopback
  loopbackMajor = loopback and loopback.version and loopback.version.split('.')[0] or 1
  if loopbackMajor < 2
    throw new Error('loopback-component-current-user requires loopback 2.0 or newer')

  # Initialize middleware
  app.middleware 'auth:after', currentUser(options)

  return
