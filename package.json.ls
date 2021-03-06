name       : \ledger-pivot
version    : \0.5.1
description: "View ledger transactions in a pivot-table in a web browser."
keywords   : <[ grid ledger pivot report table ]>
homepage   : \https://github.com/dizzib/ledger-pivot
bugs       : \https://github.com/dizzib/ledger-pivot/issues
license:   : \MIT
author     : \dizzib
bin        : \./bin/ledger-pivot
repository :
  type: \git
  url : \https://github.com/dizzib/ledger-pivot
scripts:
  start: './task/bootstrap && node ./_build/task/repl'
  test : './task/bootstrap && node ./_build/task/npm-test'
engines:
  node: '>=4.0.x'
  npm : '>=1.0.x'
dependencies:
  babyparse    : \0.4.3
  chokidar     : \2.1.2
  commander    : \2.6.0
  errorhandler : \1.3.2
  express      : \4.11.1
  'http-status': \0.1.8
  'js-yaml'    : \3.2.5
  lodash       : \4.17.11
  moment       : \2.19.3
  morgan       : \1.9.1
  pug          : \2.0.3
  shelljs      : \0.3.0
  'wait.for'   : \0.6.6
devDependencies:
  chalk        : \~0.4.0
  cron         : \~1.0.3
  growly       : \~1.3.0
  livescript   : \~1.6.0
  stylus       : \~0.54.5
preferGlobal: true
