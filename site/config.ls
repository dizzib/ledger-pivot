Fs   = require \fs
Path = require \path
_    = require \lodash
Yaml = require \js-yaml
Sh   = require \shelljs/global
Args = require \./args

cache = {}

module.exports = me =
  load : ->
    path = Args.config-path .replace \~, process.env.HOME
    return log "MISSING #path" unless test \-e path
    log "load config from #path"
    cache := Yaml.safeLoad Fs.readFileSync path
    me <<< cache

me.load!
