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
ApiCfg  = require \./api/config
ApiTxs  = require \./api/transactions
Args    = require \./args
CfgBoot = require \./config/boot
CfgSet  = require \./config/settings

const APPDIR = "#__dirname/app"
env = process.env.NODE_ENV

express = Express!
  ..set \port, Args.port
  ..use Morgan \dev if env in <[ development ]>
  ..use '/api/:pid/persist', ApiCfg.persist
  ..use '/api/:pid', (req, res, next) ->
    err, txs <- ApiTxs pid = req.params.pid
    return next err if err
    res.send config:(ApiCfg.get pid), transactions:txs
  ..use Express.static APPDIR
  ..use '/:pid', (req, res) ->
    res.send Jade.renderFile "#APPDIR/app.jade", pids:CfgSet.get-pids!
  ..use '/', (req, res) -> res.redirect Path.join '/' CfgSet.get-pids!0
  ..use ErrHan log: -> log it.stack

W4fib ->
  http = Http.createServer express
  W4m http, \listen, Args.port
  log "Express http server listening on port #{Args.port}"
