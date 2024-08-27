import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:proklinik_models/models/doctor.dart';

pw.Page createPageOne({
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
                      style: titleStyle,
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
                        style: textStyle,
                      ),
                    ),
                    pw.SizedBox(width: 20),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        height: containerHeight,
                        decoration: pw.BoxDecoration(
                          color: containerColor,
                          borderRadius: pw.BorderRadius.circular(8),
                        ),
                        child: pw.Text(
                          DateFormat.EEEE('ar').format(DateTime.now()),
                          style: textStyle,
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
                        style: textStyle,
                      ),
                    ),
                    pw.SizedBox(width: 20),
                    pw.Expanded(
                      child: pw.Container(
                        height: containerHeight,
                        alignment: pw.Alignment.center,
                        decoration: pw.BoxDecoration(
                          color: containerColor,
                          borderRadius: pw.BorderRadius.circular(8),
                        ),
                        child: pw.Text(
                          DateFormat('dd/MM/yyyy', 'ar').format(DateTime.now()),
                          style: textStyle,
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
                      style: textStyle,
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text('و', style: titleStyle),
                    pw.Expanded(
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        height: containerHeight,
                        decoration: pw.BoxDecoration(
                          color: containerColor,
                          borderRadius: pw.BorderRadius.circular(8),
                        ),
                        child: pw.Text(
                          doctor.name_ar,
                          style: textStyle,
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                    ),
                    pw.SizedBox(width: 4),
                    pw.Text(
                      '"الطرف الثاني"',
                      style: textStyle,
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      'و تخصصه',
                      style: textStyle,
                    ),
                    pw.SizedBox(width: 4),
                    pw.Expanded(
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        height: containerHeight,
                        decoration: pw.BoxDecoration(
                          color: containerColor,
                          borderRadius: pw.BorderRadius.circular(8),
                        ),
                        child: pw.Text(
                          doctor.speciality_ar,
                          style: textStyle,
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
                      style: textStyle,
                    ),
                    pw.SizedBox(width: 4),
                    pw.Expanded(
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        height: containerHeight,
                        decoration: pw.BoxDecoration(
                          color: containerColor,
                          borderRadius: pw.BorderRadius.circular(8),
                        ),
                        child: pw.Text(
                          '',
                          style: textStyle,
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                pw.Text(
                  'التمهيد',
                  style: titleStyle,
                ),
                pw.Text(
                  'التعريف ببروكلينيك',
                  style: subTitleStyle,
                ),
                pw.Wrap(
                  children: [
                    pw.Text(
                      '''
شركة متخصصة في تكنولوجيا المعلومات، تطوير البرمجيات وتحويل المحتوى الرقمي إلى أخر تفاعلي وهي منشأة حلول ذكية عبر الإنترنت تطمح في مساعدة المرضى في الحصول على أفضل استشارة. وايضا يساعد هذا النهج من الخدمة التقنية في تعزيز العلاقة القائمة بين الطبيب ومرضاه وذلك عن طريق منصة للحجز السريع تعمل على محورين، أولهما تمكين المريض الحصول على أفضل رعاية صحية عن طريق البحث والحجز والاطلاع. علي خبرات مقدمي الرعاية الصحية (الأطباء) وثانيهما مساعدة الطبيب في تنظيم العيادة باستخدام برنامج إدارة العيادات المقدم من قبل بروكلينيك.''',
                      style: textStyle,
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
