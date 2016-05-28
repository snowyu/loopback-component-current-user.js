'use strict'
loopback  = require 'loopback'
Promise   = require 'bluebird'
debug     = require('debug')('loopback:component:current-user')

module.exports = (options)->
  debug 'initializing user context middleware'
  # set current user to enable user access for remote methods
  (req, res, next) ->

    if !req.accessToken
      debug 'No current user (access token not found)'
      return next()
    app = req.app
    #req.accessToken.id
    UserModel = (options and options.user) or 'User'
    UserModel = loopback.getModel(UserModel)
    UserModel.findById(req.accessToken.userId)
    .then (user) ->
      req.currentUser = user
      debug 'req.currentUser: %o', user
      next()
    .catch (err)->
      debug 'No user with this access token was found.'
      debug err
      err = new Error('No user with this access token was found.')
      req.currentUser = null
      next(err)
