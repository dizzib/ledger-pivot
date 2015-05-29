C = require \commander
_ = require \lodash
P = require \./package.json

const DEFAULT-PORT = 7070

C.version P.version
C.usage '[Options] <directory ...>'
C.option '-p, --port [port]', "listening port (default:#DEFAULT-PORT)", DEFAULT-PORT
C.parse process.argv

module.exports = C
