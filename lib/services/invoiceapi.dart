// import 'dart:io';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';
// import 'package:pdf_creator/services/pdfapi.dart';

// import '../model/invoice_model.dart';

// class InvoiceApi{
//     static Future<Future<File>> generate(Invoice invoice) async {
//     final pdf = Document();

//     pdf.addPage(MultiPage(
//       build: (context) => [
//         buildHeader(invoice),
//         SizedBox(height: 3 * PdfPageFormat.cm),
//         buildTitle(invoice),
//         buildInvoice(invoice),
//         Divider(),
//         buildTotal(invoice),
//       ],
//       footer: (context) => buildFooter(invoice),
//     ));

//     return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
//   }
// }