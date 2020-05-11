import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart' as p;

void main(List<String> args) async {
  var parser = ArgParser();
  parser.addMultiOption('files', abbr: 'f');
  parser.addFlag('help', abbr: 'h');

  var argsParsed = parser.parse(args);

  var help = argsParsed['help'];
  if (help) {
    print('example');
    print('analysis_err_fix -f stuff.dart -f blah.dart');
    exit(0);
  }

  var files = argsParsed['files'];
  if (files == null) {
    print('no files');
    exit(2);
  }

  await verifyFiles(files);

  await renameFiles(files, RenameFileOperation.addUnderscore);

  var result1 = await Process.run('pub', ['run', 'build_runner', 'build', '--delete-conflicting-outputs']);
  print(result1.stdout);

  await renameFiles(files, RenameFileOperation.removeUnderscore);

  var result2 = await Process.run('pub', ['run', 'build_runner', 'build', '--delete-conflicting-outputs']);
  print(result2.stdout);

  print('completed');
  exit(0);
}

enum RenameFileOperation { addUnderscore, removeUnderscore }

void renameFiles(dynamic files, RenameFileOperation renameFileOperation) async {
  for (var path in files) {
    var basenameWithoutExtension = p.basenameWithoutExtension(path);

    String newName;
    String newNameNoExtension;
    String existingName;
    String existingNameNoExtension;
    String currentPath;
    if (renameFileOperation == RenameFileOperation.addUnderscore) {
      existingName = '${basenameWithoutExtension}.dart';
      existingNameNoExtension = basenameWithoutExtension;
      newName = '${basenameWithoutExtension}_.dart';
      newNameNoExtension = '${basenameWithoutExtension}_';
      currentPath = path;
    } else if (renameFileOperation == RenameFileOperation.removeUnderscore) {
      existingName = '${basenameWithoutExtension}_.dart';
      existingNameNoExtension = '${basenameWithoutExtension}_';
      newName = '${basenameWithoutExtension}.dart';
      newNameNoExtension = basenameWithoutExtension;
      //file has an underscore but our path to the file doesn't
      var result = p
          .split(path)
          .map((x) => //
              x == basenameWithoutExtension + '.dart' //
                  ? basenameWithoutExtension + '_.dart'
                  : x)
          .toList();
      currentPath = p.joinAll(result);
    }

    var file = File(p.absolute(currentPath, ''));
    final fileLines = utf8.decoder.bind(file.openRead()).transform(const LineSplitter());
    var alteredFileLines = await fileLines
        .map((x) => //
            x.contains("part '$existingNameNoExtension") //
                ? x.replaceFirst("part '$existingNameNoExtension", "part '${newNameNoExtension}")
                : x)
        .toList();

    var newFileContent = alteredFileLines.join('\n').toString();
    await file.writeAsString(
      newFileContent,
      mode: FileMode.write,
    );

    var newSplitPath = p
        .split(path)
        .map((x) => //
            x == existingName //
                ? newName
                : x)
        .toList();
    var newFilename = p.joinAll(newSplitPath);
    print("'$newFilename' from '$path'");

    await file.rename(newFilename);
  }
}

void verifyFiles(dynamic files) async {
  for (var path in files) {
    var fullPath = p.absolute(path, '');
    var isFile = await FileSystemEntity.isFile(fullPath);
    if (!isFile) {
      print('$fullPath: is not a file');
      exit(2);
    }
  }
}

//why it output twice? - there are two files!
