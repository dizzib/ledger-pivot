## ledger-pivot

Analyse your [ledger] transactions in a web-browser [pivot table]:

- define multiple reports
- pivot table layouts are automatically persisted to disk

## install and run

With [node.js] installed:

    $ npm install -g ledger-pivot  # might need to prefix with sudo
    $ ledger-pivot

then navigate your web-browser to `http://your-server:7070` to analyse
the example [wow.csv].

## configure

Configuration files live in directory `~/.config/ledger-pivot` unless
you've changed your [$XDG_CONFIG_HOME] variable.
This location can be overridden with the `-c` flag on the command line.

The [settings.yaml] should be edited as required, specifying the source
of transaction csv data and (optionally) the pivot table starting configuration.

## options

    $ ledger-pivot --help
    Usage: ledger-pivot [options]

    Options:

      -h, --help                output usage information
      -V, --version             output the version number
      -c, --config-path [path]  path to configuration files
      -p, --port [port]         listening port (default:7070)

## developer build and run

    $ npm install -g livescript   # ensure livescript is installed globally
    $ git clone git@github.com:dizzib/ledger-pivot.git
    $ cd ledger-pivot
    $ ./task/bootstrap            # compile the task runner and install dependencies
    $ node _build/task/repl       # launch the task runner
    ledger-pivot > b.a            # build all and run

## license

MIT

[$XDG_CONFIG_HOME]: http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
[ledger]: http://www.ledger-cli.org
[node.js]: http://nodejs.org
[pivot table]: http://nicolas.kruchten.com/pivottable
[settings.yaml]: ./site/config/settings.yaml
[wow.csv]: ./site/example/wow.csv
