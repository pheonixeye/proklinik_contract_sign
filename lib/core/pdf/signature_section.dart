import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:proklinik_contract_sign/models/contract_signature_result.dart';

List<pw.Widget> signatureRows({
  required PdfColor containerColor,
  required double containerHeight,
  required pw.TextStyle titleStyle,
  required pw.TextStyle subTitleStyle,
  required pw.TextStyle textStyle,
  required String signatureDate,
  required pw.ImageProvider signatureImage,
  ContractSignatureResult? result,
}) =>
    [
      //# signature title

      pw.Row(
        children: [
          pw.Spacer(),
          pw.Expanded(
            flex: 3,
            child: pw.Text(
              'الطرف الاول',
              style: subTitleStyle,
              textAlign: pw.TextAlign.start,
            ),
          ),
          pw.Spacer(),
          pw.Expanded(
            flex: 3,
            child: pw.Text(
              'الطرف الثانى',
              style: subTitleStyle,
              textAlign: pw.TextAlign.start,
            ),
          ),
          pw.Spacer(),
        ],
      ),
      //# first signature line
      pw.Row(
        children: [
          pw.Spacer(),
          pw.Expanded(
            flex: 3,
            child: pw.Container(
              alignment: pw.Alignment.centerRight,
              height: containerHeight,
              decoration: pw.BoxDecoration(
                color: containerColor,
                borderRadius: pw.BorderRadius.circular(4),
              ),
              child: pw.Row(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 8),
                    child: pw.Text(
                      'التوقيع', //TODO
                      style: textStyle,
                      textAlign: pw.TextAlign.start,
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Image(
                      signatureImage,
                      height: containerHeight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          pw.Spacer(),
          pw.Expanded(
            flex: 3,
            child: pw.Container(
              alignment: pw.Alignment.centerRight,
              height: containerHeight,
              decoration: pw.BoxDecoration(
                color: containerColor,
                borderRadius: pw.BorderRadius.circular(4),
              ),
              child: pw.Row(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 8),
                    child: pw.Text(
                      'التوقيع', //TODO
                      style: textStyle,
                      textAlign: pw.TextAlign.start,
                    ),
                  ),
                  if (result != null)
                    pw.Expanded(
                      child: pw.Image(
                        pw.MemoryImage(result.signature ?? Uint8List(0)),
                        height: containerHeight,
                      ),
                    ),
                ],
              ),
            ),
          ),
          pw.Spacer(),
        ],
      ),
      //# second signature line
      pw.SizedBox(height: 5),
      pw.Row(
        children: [
          pw.Spacer(),
          pw.Expanded(
            flex: 3,
            child: pw.Container(
              alignment: pw.Alignment.centerRight,
              height: containerHeight,
              decoration: pw.BoxDecoration(
                color: containerColor,
                borderRadius: pw.BorderRadius.circular(4),
              ),
              child: pw.Padding(
                padding: const pw.EdgeInsets.only(right: 8),
                child: pw.Text(
                  // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
                  'التاريخ' + ' ' + signatureDate,
                  style: textStyle,
                  textAlign: pw.TextAlign.start,
                ),
              ),
            ),
          ),
          pw.Spacer(),
          pw.Expanded(
            flex: 3,
            child: pw.Container(
              alignment: pw.Alignment.centerRight,
              height: containerHeight,
              decoration: pw.BoxDecoration(
                color: containerColor,
                borderRadius: pw.BorderRadius.circular(4),
              ),
              child: pw.Padding(
                padding: const pw.EdgeInsets.only(right: 8),
                child: pw.Text(
                  // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
                  'التاريخ' + ' ' + signatureDate,
                  style: textStyle,
                  textAlign: pw.TextAlign.start,
                ),
              ),
            ),
          ),
          pw.Spacer(),
        ],
      ),
    ];
