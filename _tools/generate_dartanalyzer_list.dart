import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as path;

final _tools = new Directory(path.dirname(Platform.script.toFilePath()));
final root = _tools.parent;
final run_dartanalyzer_sh = new File(path.join(_tools.path, 'run_dartanalyzer.sh'));

main() {
  run_dartanalyzer_sh.writeAsStringSync("");
  var dirList = root.listSync(recursive:true).where((FileSystemEntity fse) => path.basename(fse.path) == "pubspec.yaml" && !fse.path.contains("packages"));
  dirList.forEach((File pubspecFile){
    var exampleDir = pubspecFile.parent;
    var cdCommand = "cd ${exampleDir.path}\n";
    run_dartanalyzer_sh.writeAsStringSync(cdCommand, mode:FileMode.APPEND, flush:true);
    var dartFileList = exampleDir.listSync(recursive:true).where((FileSystemEntity fse) => path.extension(fse.path) == ".dart" && !fse.path.contains("packages"));
    dartFileList.forEach((File dartFile){
      var relativeDartFilePath = path.relative(dartFile.path, from:exampleDir.path);
      var dartanalyzerCommand = "dartanalyzer --enable-enum --enable-async $relativeDartFilePath\n";
      run_dartanalyzer_sh.writeAsStringSync(dartanalyzerCommand, mode:FileMode.APPEND, flush:true);
    });
  });
}
