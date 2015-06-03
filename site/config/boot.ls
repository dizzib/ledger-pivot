Fs   = require \fs
Path = require \path
Sh   = require \shelljs/global
Args = require \../args
Api  = require \./api
App  = require \./app

unless test \-d path = Args.config-path
  log "create config-path #path"
  mkdir \-p path

ensure-default-config Api
ensure-default-config App

Api.load!
App.load!

function ensure-default-config
  unless test \-e dest = it.file.path
    log "copy default config to #dest"
    src = Path.join __dirname, \default, it.file.name
    cp src, dest
