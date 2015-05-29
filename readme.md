## ledger-pivot

Dynamically analyse your [ledger] transactions in a JavaScript [pivot table].

## install

With [node.js] installed:

    $ npm install -g ledger-pivot      # might need to prefix with sudo

## run example

    $ ledger-pivot

then navigate your tablet to `http://your-server:7070/example`:

## developer build and run

    $ npm install -g livescript   # ensure livescript is installed globally
    $ git clone git@github.com:dizzib/ldger-pivot.git
    $ cd ldger-pivot
    $ ./task/bootstrap            # compile the task runner and install dependencies
    $ node _build/task/repl       # launch the task runner
    ldger-pivot > b.a             # build all and run

## license

MIT

[ledger]: http://www.ledger-cli.org
[node.js]: http://nodejs.org
[pivot table]: http://nicolas.kruchten.com/pivottable
