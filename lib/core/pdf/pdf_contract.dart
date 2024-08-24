// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:proklinik_contract_sign/assets/assets.dart';
import 'package:proklinik_models/models/doctor.dart';

class PdfContract {
  PdfContract(this.doctor);
  final Doctor doctor;

  Future<Uint8List> createContract(PdfPageFormat context) async {
    final ttf = await fontFromAssetBundle(AppAssets.cairoFont);
    final _logoStyle = pw.TextStyle(
      font: ttf,
      fontSize: 28,
      fontWeight: pw.FontWeight.bold,
    );

    const _containerColor = PdfColor.fromInt(0xffACE1AF);

    const _containerHeight = 24.0;

    final _titleStyle = pw.TextStyle(
      font: ttf,
      fontBold: ttf,
      fontSize: 22,
      fontWeight: pw.FontWeight.bold,
      color: const PdfColor.fromInt(0xff01411C),
    );

    final _subTitleStyle = pw.TextStyle(
      font: ttf,
      fontBold: ttf,
      fontSize: 18,
      fontWeight: pw.FontWeight.bold,
      color: const PdfColor.fromInt(0xff49796B),
    );

    final _textStyle = pw.TextStyle(
      font: ttf,
      fontBold: ttf,
      fontSize: 14,
      fontWeight: pw.FontWeight.normal,
      color: const PdfColor.fromInt(0xff00563B),
    );

    final image = await imageFromAssetBundle(AppAssets.appLogo);
    final doc = pw.Document();
    final page1 = pw.Page(
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
                  style: _logoStyle,
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
            //# padded content column
            pw.Padding(
              padding: const pw.EdgeInsets.all(16.0),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'عقد اتفاقية',
                        style: _titleStyle,
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.SizedBox(
                        width: 200,
                        child: pw.Text(
                          'ابرمت هذه الاتفاقية في يوم',
                          style: _textStyle,
                        ),
                      ),
                      pw.SizedBox(width: 20),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Container(
                          alignment: pw.Alignment.center,
                          height: _containerHeight,
                          decoration: pw.BoxDecoration(
                            color: _containerColor,
                            borderRadius: pw.BorderRadius.circular(8),
                          ),
                          child: pw.Text(
                            DateFormat.EEEE('ar').format(DateTime.now()),
                            style: _textStyle,
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.SizedBox(
                        width: 200,
                        child: pw.Text(
                          'الموافق',
                          style: _textStyle,
                        ),
                      ),
                      pw.SizedBox(width: 20),
                      pw.Expanded(
                        child: pw.Container(
                          height: _containerHeight,
                          alignment: pw.Alignment.center,
                          decoration: pw.BoxDecoration(
                            color: _containerColor,
                            borderRadius: pw.BorderRadius.circular(8),
                          ),
                          child: pw.Text(
                            DateFormat('dd/MM/yyyy', 'ar')
                                .format(DateTime.now()),
                            style: _textStyle,
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.Wrap(
                    children: [
                      pw.Text(
                        '''
(ProKliniK Systems) بين كلآ من بروكلينيك للبرمجيات الطبية
و المسجلة بسجل تجارى رقم ٩٠٦٠
و بطاقة ضريبية رقم ٥٧٥-١٣٢٥-٥١٩                      
ومقر الشركة زهراء المعادى - الشطر الثالث عشر - برج الندى - الدور الاول
ويمثلها كريم اشرف فؤاد برقم بطاقه ۲۸۹۰٤۰۹۰۱۰۳۸۳۲ بصفته الممثل القانوني للشركة ويشار إليها فيما بعد "الطرف الأول"
                      ''',
                        style: _textStyle,
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text('و', style: _titleStyle),
                      pw.Expanded(
                        child: pw.Container(
                          alignment: pw.Alignment.center,
                          height: _containerHeight,
                          decoration: pw.BoxDecoration(
                            color: _containerColor,
                            borderRadius: pw.BorderRadius.circular(8),
                          ),
                          child: pw.Text(
                            doctor.name_ar,
                            style: _textStyle,
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                      ),
                      pw.SizedBox(width: 4),
                      pw.Text(
                        '"الطرف الثاني"',
                        style: _textStyle,
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'و تخصصه',
                        style: _textStyle,
                      ),
                      pw.SizedBox(width: 4),
                      pw.Expanded(
                        child: pw.Container(
                          alignment: pw.Alignment.center,
                          height: _containerHeight,
                          decoration: pw.BoxDecoration(
                            color: _containerColor,
                            borderRadius: pw.BorderRadius.circular(8),
                          ),
                          child: pw.Text(
                            doctor.speciality_ar,
                            style: _textStyle,
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        'رقم البطاقة الشخصية',
                        style: _textStyle,
                      ),
                      pw.SizedBox(width: 4),
                      pw.Expanded(
                        child: pw.Container(
                          alignment: pw.Alignment.center,
                          height: _containerHeight,
                          decoration: pw.BoxDecoration(
                            color: _containerColor,
                            borderRadius: pw.BorderRadius.circular(8),
                          ),
                          child: pw.Text(
                            '',
                            style: _textStyle,
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.Text(
                    'التمهيد',
                    style: _titleStyle,
                  ),
                  pw.Text(
                    'التعريف ببروكلينيك',
                    style: _subTitleStyle,
                  ),
                  pw.Wrap(
                    children: [
                      pw.Text(
                        '''
شركة متخصصة في تكنولوجيا المعلومات، تطوير البرمجيات وتحويل المحتوى الرقمي إلى أخر تفاعلي وهي منشأة حلول ذكية عبر الإنترنت تطمح في مساعدة المرضى في الحصول على أفضل استشارة. وايضا يساعد هذا النهج من الخدمة التقنية في تعزيز العلاقة القائمة بين الطبيب ومرضاه وذلك عن طريق منصة للحجز السريع تعمل على محورين، أولهما تمكين المريض الحصول على أفضل رعاية صحية عن طريق البحث والحجز والاطلاع. علي خبرات مقدمي الرعاية الصحية (الأطباء) وثانيهما مساعدة الطبيب في تنظيم العياد باستخدام برنامج إدارة العيادات المقدم من قبل بروكلينيك.''',
                        style: _textStyle,
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
                          style: _subTitleStyle,
                          textAlign: pw.TextAlign.start,
                        ),
                      ),
                      pw.Spacer(),
                      pw.Expanded(
                        flex: 3,
                        child: pw.Text(
                          'الطرف الثانى',
                          style: _subTitleStyle,
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
                          height: _containerHeight,
                          decoration: pw.BoxDecoration(
                            color: _containerColor,
                            borderRadius: pw.BorderRadius.circular(4),
                          ),
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.only(right: 8),
                            child: pw.Text(
                              'الاسم',
                              style: _textStyle,
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
                          height: _containerHeight,
                          decoration: pw.BoxDecoration(
                            color: _containerColor,
                            borderRadius: pw.BorderRadius.circular(4),
                          ),
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.only(right: 8),
                            child: pw.Text(
                              'الاسم',
                              style: _textStyle,
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
                          height: _containerHeight,
                          decoration: pw.BoxDecoration(
                            color: _containerColor,
                            borderRadius: pw.BorderRadius.circular(4),
                          ),
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.only(right: 8),
                            child: pw.Text(
                              'التاريخ',
                              style: _textStyle,
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
                          height: _containerHeight,
                          decoration: pw.BoxDecoration(
                            color: _containerColor,
                            borderRadius: pw.BorderRadius.circular(4),
                          ),
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.only(right: 8),
                            child: pw.Text(
                              'التاريخ',
                              style: _textStyle,
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
    doc.addPage(page1);

    return doc.save();
  }
}
