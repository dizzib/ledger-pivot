Fs   = require \fs
Path = require \path
_    = require \lodash
Yaml = require \js-yaml
Sh   = require \shelljs/global
Args = require \../args

const NAME = \app.yaml
const PATH = Path.join Args.config-path, NAME
cache = {}

module.exports = me =
  file:
    name: NAME
    path: PATH
  load: ->
    return log "MISSING #PATH" unless test \-e PATH
    log "load app config from #PATH"
    cache := Yaml.safeLoad Fs.readFileSync PATH
    me <<< cache
  save: (pid, key, value, cb) ->
    cache{}[pid][key] = value
    yaml = Yaml.safeDump cache
    err <- Fs.writeFile PATH, yaml
    cb err if err
    me <<< cache
    cb!
