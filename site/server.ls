global.log = console.log

ErrHan  = require \errorhandler
Express = require \express
Fs      = require \fs
Http    = require \http
Jade    = require \jade
Morgan  = require \morgan
Path    = require \path
Shell   = require \shelljs/global
W4m     = require \wait.for .forMethod
W4fib   = require \wait.for .launchFiber
Args    = require \./args
ApiGen  = require \./api/generate
ApiPer  = require \./api/persist
CfgApi  = require \./config/api
CfgBoot = require \./config/boot

const APPDIR = "#__dirname/app"

express = Express!
  ..set \port, Args.port
  ..use Morgan \dev
  ..get '/api/:pid/transactions', ApiGen
  ..get '/api/:pid/persist', ApiPer
  ..use Express.static APPDIR
  ..use '/:pid', (req, res) ->
    res.send Jade.renderFile "#APPDIR/app.jade", pids:CfgApi.get-pids!
  ..use ErrHan log: -> log it.stack

W4fib ->
  http = Http.createServer express
  W4m http, \listen, Args.port
  log "Express http server listening on port #{Args.port}"
