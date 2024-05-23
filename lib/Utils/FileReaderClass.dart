import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class FileReaderClass {
  Future<List<String>> readFile(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/$fileName';
      final file = File(path);

      if (await file.exists()) {
        return file.readAsLines();
      } else {
        // If file doesn't exist in documents directory, read from assets
        final assetData = await rootBundle.loadString('assets/$fileName');
        return assetData.split('\n');
      }
    } catch (e) {
      throw Exception('Error reading file: $e');
    }
  }
}
