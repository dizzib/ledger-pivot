Setts = require \../config/settings
State = require \../config/state

module.exports =
  get: (pid) ->
    cfg = Setts.get pid .pivot or {}
    cfg <<< State.read pid
  persist: (req, res, next) ->
    State.write req.params.pid, req.query, next
