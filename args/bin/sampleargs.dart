import 'package:args/args.dart' as args;
import 'package:args/command_runner.dart' as command_runner;
import 'dart:async';
import 'dart:io' as io;


main(List<String> args) {
  var runner = new command_runner.CommandRunner("sampleargs", "Demonstrates use of the args library.");
  runner.argParser
  ..addOption(
    'log',
    abbr:'l',
    help: "Set log level.",
    allowed: ['NONE', 'INFO', 'FINE', 'FINER', 'DEBUG'],
    defaultsTo: 'NONE'
  )

  ..addFlag(
    'myflag1',
    abbr:'f'
  );

  runner.addCommand(new MyCommand());

  runZoned(() {
    runner.run(args)
    .whenComplete(() => print(""));
  }, onError: (error, stackTrace) {
    args.ArgResults results = runner.parse(args);
    Command command = runner.commands[results.command.name];
    command.printUsage();
  });
}

class MyCommand extends command_runner.Command {
  String get name => "mycommand";
  String get description => "Description about mycommand.";

  Map get data => {
    'log':globalResults['log'],
    'myflag1':globalResults['myflag1'],
    'myoption':argResults['myoption'],
    'myflag2':argResults['myflag2']
  };

  MyCommand() {
    argParser
    ..addOption(
      'myoption',
      abbr: 'o'
    )

    ..addFlag(
      'myflag2',
      abbr:'f'
    );

    addSubcommand(new MySubCommand1());
    addSubcommand(new MySubCommand2());
  }

  Future run() {
    print(data);
    return new Future.value(true);
  }
}

class MySubCommand1 extends command_runner.Command {
  String get name => "subcommand1";
  String get description => "Description about subcommand1.";

  Map get data => {
    'log':globalResults['log'],
    'myflag1':globalResults['myflag1'],
    'myoption':argResults['myoption'],
    'myflag2':argResults['myflag2']
  };

  MySubCommand1() {
    argParser
    ..addOption(
      'myoption',
      abbr: 'o'
    )

    ..addFlag(
      'myflag2',
      abbr:'f'
    );
  }

  Future run() {
    print(data);
    return new Future.value(true);
  }
}

class MySubCommand2 extends command_runner.Command {
  String get name => "subcommand2";
  String get description => "Description about subcommand2.";

  Map get data => {
    'log':globalResults['log'],
    'myflag1':globalResults['myflag1'],
    'myoption':argResults['myoption'],
    'myflag2':argResults['myflag2']
  };

  MySubCommand2() {
    argParser
    ..addOption(
      'myoption',
      abbr: 'o'
    )

    ..addFlag(
      'myflag2',
      abbr:'f'
    );
  }

  Future run() {
    print(data);
    return new Future.value(true);
  }
}