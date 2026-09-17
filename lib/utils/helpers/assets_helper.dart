import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

class AssetsHelper {
  /// function that returns base64 image
  static Future<String> loadImageAsBase64(String assetPath) async {
    final ByteData byteData = await rootBundle.load(assetPath);
    final Uint8List unit8List = byteData.buffer.asUint8List();
    return base64Encode(unit8List);
  }

  /// function that returns file path
  static Future<String> getImageFromAssets(String asset) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/${asset.split('/').last}';
      final file = File(filePath);

      /// Check if the file already exists in the temp directory
      if (await file.exists()) {
        return filePath;
      }

      /// Load asset and save to the temp directory if not already present
      final byteData = await rootBundle.load(asset);
      await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      return filePath;
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }
}
