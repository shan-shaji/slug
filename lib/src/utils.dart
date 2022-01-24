import 'dart:io';

import 'package:path/path.dart' as path;

bool isSdkDir(Directory dir) =>
    FileSystemEntity.isFileSync(path.join(dir.path, 'version'));
