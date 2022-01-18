import 'dart:io';

import 'package:archive/archive_io.dart';

/// Encoder to create the zip file required by Widgetbook Core backend
class WidgetbookZipEncoder {
  /// Encodes the directory to a .zip file
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
