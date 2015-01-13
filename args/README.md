# args

Reference: [args pub package](https://pub.dartlang.org/packages/args)

---

Parses raw command-line arguments into a set of options and values.

# Setup

```
pub get
```

# Run

## dart bin/sampleargs.dart

```
Demonstrates use of the args library.

Usage: sampleargs <command> [arguments]

Global options:
-h, --help            Print this usage information.
-l, --log             Set log level.
                      [NONE (default), INFO, FINE, FINER, DEBUG]

-f, --[no-]myflag1

Available commands:
  help        Display help information for sampleargs.
  mycommand   Description about mycommand.

Run "sampleargs help <command>" for more information about a command.
```

## mycommand --help

```
dart bin/sampleargs.dart mycommand --help
```

```
Description about mycommand.

Usage: sampleargs mycommand [arguments]
-h, --help            Print this usage information.
-o, --myoption
-f, --[no-]myflag2

Run "sampleargs help" to see global options.
```

## mycommand -l INFO -f mycommand -o test -f

```
dart bin/sampleargs.dart -l INFO -f mycommand -o test -f
```

```
{log: INFO, myflag1: true, myoption: test, myflag2: true}
```