Bp = require \babyparse
Fs = require \fs
_  = require \lodash

module.exports = (req, res, next) ->
  err, buf <- Fs.readFile \/mnt/project/LIFE.FINANCE/ledger/master.csv
  return log err if err
  parsed = Bp.parse buf.toString!, skipEmptyLines:true
  txs = _.map parsed.data, ->
    [ date, code, payee, account, commodity, amount, status, notes ] = it
    tx =
      Year     : (dt = new Date date).getFullYear!
      Month    : <[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]>[dt.getMonth!]
      Day      : dt.getDate!
      Code     : code
      Payee    : payee
      Commodity: commodity
      Amount   : amount
      Status   : status
      Notes    : notes
    for i from 0 to 3 then tx[get-level-name i] = (account / \:)[i] or ''
    tx

  res.send do
    options:
      aggregatorName: \Sum
      cols: <[Commodity Year Month]>
      rendererName: \Heatmap
      rows: [ get-level-name i for i from 0 to 3 ]
      vals: <[Amount]>
    transactions: txs

function get-level-name n
  function segment then if it is n then " Level #n " else '  '
  "#{segment 0}:#{segment 1}:#{segment 2}:#{segment 3}"
