import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf_creator/services/pdfapi.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class HomeProvider extends ChangeNotifier {
  PdfApi pdfApi = PdfApi();
  File? file;
  var path;

  Future imagePicker() async {
    final image = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (image == null) return;
    path = image.files.single.path;
    file = File(path!);
    notifyListeners();
  }

  Future<Uint8List> readImgesData(
    String name,
  ) async {
    final data = await rootBundle.load(
      "images/$name",
    );
    log(data.runtimeType.toString());
    return data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );
  }

  Future<void> createPdf() async {
    PdfDocument document = PdfDocument();
    final page1 = document.pages.add();
    page1.graphics.drawString(
      "Mubashir vp",
      PdfStandardFont(
        PdfFontFamily.courier,
        40,
      ),
    );
    page1.graphics.drawImage(
      PdfBitmap(
        await readImgesData(
          "1646132229641.jpg",
        ),
      ),
      const Rect.fromLTWH(
        30,
        100,
        400,
        550,
      ),
    );
    page1.graphics.drawString(
        "Resume",
        PdfStandardFont(
          PdfFontFamily.courier,
          40,
        ),
        bounds: const Rect.fromLTWH(
          300,
          0,
          150,
          100,
        ));
    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
      font: PdfStandardFont(
        PdfFontFamily.timesRoman,
        25,
      ),
    );
    grid.columns.add(
      count: 4,
    );
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Roll no';
    header.cells[1].value = 'name';
    header.cells[2].value = 'class';
    header.cells[3].value = 'mark';

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = '1';
    row.cells[1].value = 'mubashir';
    row.cells[2].value = 'Bca';
    row.cells[3].value = '39';
    PdfGridRow row1 = grid.rows.add();
    row1.cells[0].value = '2';
    row1.cells[1].value = 'JUnaid';
    row1.cells[2].value = 'Bsc';
    row1.cells[3].value = '40';
    PdfGridRow row2 = grid.rows.add();
    row2.cells[0].value = '3';
    row2.cells[1].value = 'Shamil';
    row2.cells[2].value = 'Bcom';
    row2.cells[3].value = '40';
    grid.draw(
      page: document.pages.add(),
      bounds: const Rect.fromLTWH(
        0,
        0,
        0,
        0,
      ),
    );
    List<int> bytes = document.save();
    document.dispose();

    await PdfApi.saveDocument(
      bytes: bytes,
      filename: "Output.pdf",
    );
  }
}
