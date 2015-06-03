Cp   = require \child_process
Fs   = require \fs
Path = require \path
Cfg  = require \../config/api

module.exports =
  read: (pid, cb) ->
    return cb new Error "pid #pid is not configured" unless cfg = Cfg[pid]
    if path = cfg.source?path
      path .= replace \$EXAMPLE Path.join __dirname, \../example
      log "read csv from file: #path"
      err, buf <- Fs.readFile path
      return cb err if err
      cb null, buf.toString!
    else if cmd = cfg.source?command
      log "generate csv by command: #cmd"
      err, stdout, stderr <- Cp.exec cmd
      return cb err if err
      cb null, stdout.toString!
    else
      cb new Error "Config file #{Cfg.file.path} must contain either a source path or command."
