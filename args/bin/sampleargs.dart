import 'package:args/command_runner.dart' as command_runner;
import 'dart:async';


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

  runner.run(args)
  .whenComplete(() => print(""));
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
  }

  Future run() {
    print(data);
    return new Future.value(true);
  }
}
