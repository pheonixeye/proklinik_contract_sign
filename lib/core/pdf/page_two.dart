import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:proklinik_models/models/doctor.dart';

pw.Page createPageTwo({
  required PdfPageFormat context,
  required pw.ImageProvider image,
  required pw.TextStyle logoStyle,
  required PdfColor containerColor,
  required double containerHeight,
  required pw.TextStyle titleStyle,
  required pw.TextStyle subTitleStyle,
  required pw.TextStyle textStyle,
  required Doctor doctor,
}) {
  return pw.Page(
    margin: const pw.EdgeInsets.all(4),
    textDirection: pw.TextDirection.rtl,
    pageFormat: context,
    build: (context) {
      return pw.Column(
        children: [
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
          pw.SizedBox(height: 5),
          //# proklinik logo
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
          ),
          pw.SizedBox(height: 5),
          pw.Padding(
            padding: const pw.EdgeInsets.all(16.0),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                //TODO: second page content
                pw.Wrap(
                  children: [
                    pw.Text(
                      'وحيث أن الطرف الأول "بروكلينيك "هو منتج يقدم للمريض مجانا عبر الانترنت على العديد من المنصات : تطبيق الطبيب و تطبيق المريض الإلكتروني وحيث أن الطرف الثاني "الطبيب" مهتم باستخدام منتج الطرف الأول، اتفق الطرفان على البنود والشروط التالية',
                      style: textStyle,
                    ),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Text(
                      'أولا: نطاق الخدمة',
                      style: titleStyle,
                    ),
                  ],
                ),
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
                        child: pw.Padding(
                          padding: const pw.EdgeInsets.only(right: 8),
                          child: pw.Text(
                            'الاسم',
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
                            'الاسم',
                            style: textStyle,
                            textAlign: pw.TextAlign.start,
                          ),
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
                            'التاريخ',
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
                            'التاريخ',
                            style: textStyle,
                            textAlign: pw.TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                    pw.Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
