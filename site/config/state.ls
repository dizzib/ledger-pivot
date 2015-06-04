Fs   = require \fs
Path = require \path
Yaml = require \js-yaml
Sh   = require \shelljs/global
Args = require \../args

function get-path pid then Path.join Args.config-path, "state.#pid.yaml"

module.exports = me =
  read: (pid) ->
    path = get-path pid
    return {} unless test \-e path
    #log "load state from #path"
    Yaml.safeLoad Fs.readFileSync path
  write: (pid, state, cb) ->
    path = get-path pid
    yaml = Yaml.safeDump state
    Fs.writeFile path, yaml, cb
