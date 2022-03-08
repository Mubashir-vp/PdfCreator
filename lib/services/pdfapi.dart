import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PdfApi {
  static Future<void> saveDocument({
    required List<int> bytes,
    required String filename,
  }) async {
    final path = (await getExternalStorageDirectory())!.path;
    log(path.toString());
    final file = File(
      '$path/$filename',
    );
    await file.writeAsBytes(
      bytes,
      flush: true,
    );
    OpenFile.open(
      '$path/$filename',
    );
  }
}
