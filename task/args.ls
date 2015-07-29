C = require \commander

C.option '--npm-local [dir]' 'local publish directory'
C.parse process.argv

module.exports = C
