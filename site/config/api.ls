Chok = require \chokidar
Fs   = require \fs
Path = require \path
_    = require \lodash
Yaml = require \js-yaml
Sh   = require \shelljs/global
Args = require \../args

const NAME = \api.yaml
const PATH = Path.join Args.config-path, NAME

var cache
var watcher

module.exports = me =
  file:
    name: NAME
    path: PATH
  load: ->
    return log "MISSING #PATH" unless test \-e PATH
    log "load api config from #PATH"
    cache := Yaml.safeLoad Fs.readFileSync PATH
    me <<< cache
    return if watcher?
    watcher := Chok.watch PATH
    watcher.on \change me.load
