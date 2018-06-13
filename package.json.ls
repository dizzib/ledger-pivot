name       : \ledger-pivot
version    : \0.3.1
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
  node: '>=0.10.x'
  npm : '>=1.0.x'
dependencies:
  babyparse    : \0.4.3
  chokidar     : \1.6.1
  commander    : \2.6.0
  errorhandler : \1.3.2
  express      : \4.11.1
  'http-status': \0.1.8
  jade         : \1.9.2
  'js-yaml'    : \3.2.5
  lodash       : \3.5.0
  moment       : \2.14.1
  morgan       : \1.5.1
  shelljs      : \0.3.0
  'wait.for'   : \0.6.6
devDependencies:
  chalk        : \~0.4.0
  cron         : \~1.0.3
  growly       : \~1.2.0
  livescript   : \~1.5.0
  stylus       : \~0.49.3
preferGlobal: true
