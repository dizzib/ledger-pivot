Bp  = require \babyparse
Fs  = require \fs
_   = require \lodash
M   = require \moment
Src = require \./source

module.exports = (pid, cb) ->
  err, csv <- Src.read pid
  return cb err if err
  parsed = Bp.parse csv, skipEmptyLines:true
  return cb parsed.errors if parsed.errors.length
  cb null, _.map parsed.data, ->
    [ date, code, payee, account, commodity, amount, status, notes ] = it
    d = new Date date
    y = d.getUTCFullYear! + if m = d.getUTCMonth! < 3 then 0 else 1
    if m is 3 and d.getUTCDate! < 6 then y-- # 'UK tax year starts on 6 April
    tx =
      AgeYears : M!subtract(1 \month).endOf(\month).diff d, \years
      Amount   : amount
      Code     : code
      Commodity: commodity
      Date     : date
      Notes    : notes
      Payee    : payee
      Status   : status
      TaxYear  : "#{y - 1}/#y"
    for i from 0 to 3 then tx["Account-Level-#i"] = (account / \:)[i] or ''
    tx
