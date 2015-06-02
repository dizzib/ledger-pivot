C = require \commander
_ = require \lodash
P = require \path
J = require \./package.json

const DEFAULT-PORT = 7070
const DEFAULT-CONFIG-PATH = \$XDG_CONFIG_HOME/ledger-pivot

config_home = process.env.XDG_CONFIG_HOME or P.join process.env.HOME, \.config
default-config-path = DEFAULT-CONFIG-PATH.replace \$XDG_CONFIG_HOME config_home

C.version J.version
C.usage '[Options]'
C.option '-c, --config-path [path]', "path to configuration files (default:#default-config-path)", default-config-path
C.option '-p, --port [port]', "listening port (default:#DEFAULT-PORT)", DEFAULT-PORT
C.parse process.argv

module.exports = C
