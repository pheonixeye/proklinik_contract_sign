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
  required String signatureDate,
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
                pw.Wrap(
                  children: [
                    pw.Text(
                      'وحيث أن الطرف الأول "بروكلينيك "هو منتج يقدم للمريض مجانا عبر الانترنت على العديد من المنصات : تطبيق الطبيب و تطبيق المريض الإلكتروني وحيث أن الطرف الثاني "الطبيب" مهتم باستخدام منتج الطرف الأول، اتفق الطرفان على البنود والشروط التالية',
                      style: textStyle,
                    ),
                  ],
                ),
                //# contract items

                //# contract item 1 title
                pw.Row(
                  children: [
                    pw.Text(
                      'أولا: نطاق الخدمة',
                      style: titleStyle,
                    ),
                  ],
                ),
                //# contract item 1 paragraph
                pw.Wrap(
                  children: [
                    pw.Text(
                      [
                        'يقدم الطرف الأول طريقة سهلة وأمنة لتجميع قاعدة بيانات طبية للمريض ومستندات الفحص، يستغرق تطبيق',
                        'بروكلينيك فقط دقيفتين ولا يحتاج إلى أى مهارات تقنية ويمكن إضافة كل طلب بضغطة واحدة للحجز. صمم نموذج',
                        'بروكلينيك ليتم ملأه على أى هاتف ذكى، أو كمبيوتر شخصي. يعمل بروكلينيك على خفض نسبة التخلف عن الموعد عن',
                        'طريق الإنترنت بتوفير الموعد المناسب لحضور المريض و الذى يتواجد فيه الطبيب فى عيادته.',
                        'يدير بروكلينيك جميع السجلات إلكترونيا وبالتالى يقلل المجهود',
                        'اليدوى المبذول في العمل الاشرافى والتوثيق. يستخدم بروكلينيك المصادر الطبية والعمالة الخاصة بك عن طريق',
                        'إدارة جدولهم عبر الإنترنت.',
                      ].join(' '),
                      style: textStyle,
                    ),
                  ],
                ),
                //# contract item 2 title
                pw.Row(
                  children: [
                    pw.Text(
                      'ثانيا: التزامات الطرف الاول',
                      style: titleStyle,
                    ),
                  ],
                ),
                //# contract item 2 paragraph
                pw.Wrap(
                  children: [
                    pw.Text(
                      [
                        '(١) ',
                        'يوفر الطرف الأول حساب خاص للطرف الثاني يحتوى على سيرته الذاتية، صورة شخصية وصورة للعيادة الخاصة به',
                        '(٢) ',
                        'يوفر الطرف الأول التدريب الأمثل للطرف الثاني “الطبيب“ المشترك في خدمة كلينيدو ليتمكن من التعامل مع التطبيق. ويقوم بالتدريب ممثل الطرف الأول المؤهل تماما لذلك',
                      ].join(' '),
                      style: textStyle,
                    ),
                  ],
                ),
                //# contract item 3 title
                pw.Row(
                  children: [
                    pw.Text(
                      'ثالثا: التزامات الطرف الثانى',
                      style: titleStyle,
                    ),
                  ],
                ),
                //# contract item 3 paragraph
                pw.Wrap(
                  children: [
                    pw.Text(
                      [
                        '(١) ',
                        'يلتزم الطرف الثانى بتقديم جميع البيانات الخاصة بساعات عمله، تكلفة الكشف، فترة الانتظار وفي حالة حدوث أى تغيير في ساعات العمل يلتزم بإبلاغ الشركة “الطرف الأول“ بهذا التغيير',
                        '(٢) ',
                        'يوفر الطرف الثاني بريد إلكتروني ورقم هاتف يتم التواصل من خلالهم مع الطرف الأول',
                        '(٣) ',
                        'الرسوم واالاسعار المعلنة على تطبيقات بروكلينيك يجب ان تكون هى ذات الرسوم والاسعار التى يتعامل بها الطبيب فى العيادة'
                      ].join(' '),
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
                            'التوقيع',
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
                            'التوقيع',
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
              ],
            ),
          ),
        ],
      );
    },
  );
}
