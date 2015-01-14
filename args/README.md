# args

Reference: [args pub package](https://pub.dartlang.org/packages/args)

---

Parses raw command-line arguments into a set of options and values.

# Setup

```
pub get
```

# Run

```
$ dart bin/sampleargs.dart
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

```
$ dart bin/sampleargs.dart mycommand

Description about mycommand.

Usage: sampleargs mycommand <subcommand> [arguments]
-h, --help            Print this usage information.
-o, --myoption
-f, --[no-]myflag2

Available subcommands:
  subcommand1   Description about subcommand1.
  subcommand2   Description about subcommand2.

Run "sampleargs help" to see global options.
```

```
$ dart bin/sampleargs.dart mycommand subcommand1 -h
Description about subcommand1.

Usage: sampleargs mycommand subcommand1 [arguments]
-h, --help            Print this usage information.
-o, --myoption
-f, --[no-]myflag2

Run "sampleargs help" to see global options.
```

```
$ dart bin/sampleargs.dart mycommand subcommand2 -h
Description about subcommand2.

Usage: sampleargs mycommand subcommand2 [arguments]
-h, --help            Print this usage information.
-o, --myoption
-f, --[no-]myflag2

Run "sampleargs help" to see global options.
```

```
$ dart bin/sampleargs.dart -l FINE -f mycommand subcommand2 -o foo -f
{log: FINE, myflag1: true, myoption: foo, myflag2: true}
```