Bp  = require \babyparse
Fs  = require \fs
_   = require \lodash
Src = require \./source
Cfg = require \../config/app

module.exports = (req, res, next) ->
  err, csv <- Src.read pid = req.params.pid
  return next err if err
  parsed = Bp.parse csv, skipEmptyLines:true
  txs = _.map parsed.data, ->
    [ date, code, payee, account, commodity, amount, status, notes ] = it
    tx =
      Date     : date
      Code     : code
      Payee    : payee
      Commodity: commodity
      Amount   : amount
      Status   : status
      Notes    : notes
    for i from 0 to 3 then tx["Account-Level-#i"] = (account / \:)[i] or ''
    tx
  res.send options:Cfg[pid]?options, transactions:txs
