Hst = require \http-status
Cfg = require \../config/app

module.exports = (req, res) ->
  err <- Cfg.save \options req.query
  log err if err
  res.status Hst.INTERNAL_SERVER_ERROR if err
  res.send!
