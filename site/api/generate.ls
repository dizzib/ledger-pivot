Bp  = require \babyparse
Fs  = require \fs
_   = require \lodash
Src = require \./source
Cfg = require \../config

module.exports = (req, res) ->
  err, csv <- Src.read
  return log err if err
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
  res.send options:Cfg.options, transactions:txs
