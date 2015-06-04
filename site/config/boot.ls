Fs   = require \fs
Path = require \path
Sh   = require \shelljs/global
Args = require \../args
Sets = require \./settings

unless test \-d path = Args.config-path
  log "create config-path #path"
  mkdir \-p path

unless test \-e dest = Sets.file.path
  log "copy default settings to #dest"
  src = Path.join __dirname, Sets.file.name
  cp src, dest

Sets.load!
