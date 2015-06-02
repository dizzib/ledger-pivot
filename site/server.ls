global.log = console.log

ErrHan  = require \errorhandler
Express = require \express
Fs      = require \fs
Http    = require \http
Morgan  = require \morgan
Path    = require \path
Shell   = require \shelljs/global
W4m     = require \wait.for .forMethod
W4fib   = require \wait.for .launchFiber
Args    = require \./args
ApiGen  = require \./api/generate
ApiPer  = require \./api/persist
CfgBoot = require \./config/boot

express = Express!
  ..set \port, Args.port
  ..use Morgan \dev
  ..get '/api/transactions', ApiGen
  ..get '/api/persist', ApiPer
  ..use Express.static "#__dirname/app"
  ..use ErrHan!

W4fib ->
  http = Http.createServer express
  W4m http, \listen, Args.port
  log "Express http server listening on port #{Args.port}"
