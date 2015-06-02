Fs  = require \fs
Cfg = require \../config

module.exports =
  read: (cb) ->
    src = Cfg.source
    log "source transactions from #src"
    err, buf <- Fs.readFile src
    return cb err if err
    cb null, buf.toString!
