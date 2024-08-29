import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

pw.Widget logo({
  required pw.TextStyle logoStyle,
  required pw.ImageProvider image,
}) =>
    pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
        pw.Text(
          'ProKliniK',
          style: logoStyle,
        ),
        pw.SizedBox(width: 10),
        pw.SizedBox(
          width: 50,
          height: 50,
          child: pw.Image(image),
        ),
        pw.SizedBox(width: 10),
      ],
    );

List<pw.Widget> header = [
  //# colored green container
  pw.SizedBox(
    height: 10,
    child: pw.Row(
      children: [
        pw.Expanded(
          flex: 1,
          child: pw.Container(
            height: 10,
            color: const PdfColor.fromInt(0xff4caf50),
          ),
        ),
        pw.Expanded(
          flex: 9,
          child: pw.Container(
            height: 10,
            color: const PdfColor.fromInt(0xff65ed6a),
          ),
        ),
      ],
    ),
  ),
];
List<pw.Widget> footer = [
  pw.Spacer(),
  //# colored green container
  pw.SizedBox(
    height: 10,
    child: pw.Row(
      children: [
        pw.Expanded(
          flex: 10,
          child: pw.Container(
            height: 10,
            color: const PdfColor.fromInt(0xff4caf50),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Container(
            height: 10,
            color: const PdfColor.fromInt(0xff65ed6a),
          ),
        ),
      ],
    ),
  ),
];
