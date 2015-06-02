C = require \commander
_ = require \lodash
P = require \./package.json

const DEFAULT-PORT = 7070
const DEFAULT-CONFIG-PATH = \~/.ledger-pivot.yaml

C.version P.version
C.usage '[Options]'
C.option '-c, --config-path [path]', "path to configuration file (default:#DEFAULT-CONFIG-PATH)", DEFAULT-CONFIG-PATH
C.option '-p, --port [port]', "listening port (default:#DEFAULT-PORT)", DEFAULT-PORT
C.parse process.argv

module.exports = C
