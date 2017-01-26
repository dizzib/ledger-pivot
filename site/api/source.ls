Cp    = require \child_process
Fs    = require \fs
Path  = require \path
Setts = require \../config/settings

module.exports =
  read: (pid, cb) ->
    try settings = Setts.get pid
    catch then return cb it

    if path = settings.source?path
      path .= replace \$EXAMPLE Path.join __dirname, \../example
      log "read file: #path"
      err, buf <- Fs.readFile path
      return cb err if err
      cb null buf.toString!
    else if cmd = settings.source?command
      log "run command: #cmd"
      err, stdout, stderr <- Cp.exec cmd
      return cb err if err
      cb null stdout.toString!
    else
      cb new Error "#{Setts.file.path} must specify a source path or command for #pid"
