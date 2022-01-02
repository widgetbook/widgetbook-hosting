import 'dart:io';

import 'package:archive/archive_io.dart';

class WidgetbookZipEncoder {
  File? encode(Directory directory) {
    if (directory.existsSync()) {
      const fileName = 'deployment.zip';
      ZipFileEncoder()
        ..create(fileName)
        ..addDirectory(
          directory,
        )
        ..close();
      final createdZip = File(fileName);
      if (!createdZip.existsSync()) {
        return null;
      }
      return createdZip;
    }
  }
}
