Fs   = require \fs
Path = require \path
_    = require \lodash
Yaml = require \js-yaml
Sh   = require \shelljs/global
Args = require \./args

const PATH = Args.config-path .replace \~, process.env.HOME
cache = {}

module.exports = me =
  load: ->
    return log "MISSING #PATH" unless test \-e PATH
    log "load config from #PATH"
    cache := Yaml.safeLoad Fs.readFileSync PATH
    me <<< cache
  save: (key, value, cb) ->
    cache[key] = value
    yaml = Yaml.safeDump cache
    err <- Fs.writeFile PATH, yaml
    cb err if err
    me <<< cache
    cb!

me.load!
