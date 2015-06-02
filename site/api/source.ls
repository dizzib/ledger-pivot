Cp  = require \child_process
Fs  = require \fs
Cfg = require \../config/api

module.exports =
  read: (cb) ->
    if path = Cfg.source?path
      log "read csv from file: #path"
      err, buf <- Fs.readFile path
      return cb err if err
      cb null, buf.toString!
    else if cmd = Cfg.source?command
      log "generate csv by command: #cmd"
      err, stdout, stderr <- Cp.exec cmd
      return cb err if err
      cb null, stdout.toString!
    else
      cb new Error "Config file #{Cfg.file.path} must contain either a source path or command."
