Chok = require \chokidar
Fs   = require \fs
Path = require \path
_    = require \lodash
Yaml = require \js-yaml
Sh   = require \shelljs/global
Args = require \../args

const NAME = \settings.yaml
const PATH = Path.join Args.config-path, NAME

var cache
var watcher

module.exports = me =
  file:
    name: NAME
    path: PATH
  get: (pid) ->
    throw new Error "Missing settings for #pid" unless _.has cache, pid
    cache[pid]
  get-pids: ->
    _.keys cache
  load: ->
    return log "MISSING #PATH" unless test \-e PATH
    log "load settings from #PATH"
    cache := Yaml.safeLoad Fs.readFileSync PATH
    return if watcher?
    watcher := Chok.watch PATH
    watcher.on \change me.load
