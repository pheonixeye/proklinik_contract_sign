import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:proklinik_contract_sign/core/pdf/logo_header_footer.dart';
import 'package:proklinik_contract_sign/core/pdf/signature_section.dart';
import 'package:proklinik_contract_sign/models/contract_signature_result.dart';
import 'package:proklinik_models/models/doctor.dart';

pw.Page createPageFour({
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
  required pw.ImageProvider signatureImage,
  ContractSignatureResult? result,
}) {
  return pw.Page(
    margin: const pw.EdgeInsets.all(4),
    textDirection: pw.TextDirection.rtl,
    pageFormat: context,
    build: (context) {
      return pw.Column(
        children: [
          ...header,
          pw.SizedBox(height: 5),
          //# proklinik logo
          logo(
            logoStyle: logoStyle,
            image: image,
          ),
          pw.SizedBox(height: 5),
          pw.Padding(
            padding: const pw.EdgeInsets.all(16.0),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                //# contract item 5 title
                pw.Row(
                  children: [
                    pw.Text(
                      'خامسا : تسوية الحساب',
                      style: titleStyle,
                    ),
                  ],
                ),
                //# contract item 5 paragraph
                pw.Wrap(
                  children: [
                    pw.Text(
                      [
                        '(١) ',
                        'يقوم الطرف الاول بتحصيل مبلغ و قدره (مائة جنيها مصريا فقط لا غير) عن كل الزيارات المستحقة و الدفع سارى علي جميع التخصصات الطبية و الاسنان',
                        ' (٢) ',
                        'سداد الرسوم يتم شهريا يصدر الطرف الاول فاتورة بالخدمة شهريا كما هو متفق عليه مع الطرف الثانى و باستلام الفاتورة يسدد الطرف الثانى الرسوم كاملة خلال (عشرة ايام) من تاريخ استلام الفاتورة',
                        ' (٣) ',
                        'تأخر الطرف الثانى عن سداد الفاتورة فى تاريخ الاستحقاق يعد خرقا لهذا العقد و يحق للطرف الاول تعليق الخدمة حتى سداد كافة المستحقات',
                        ' (٤) ',
                        'يتم اضافة (اربعة عشر بالمائة) تحت بند ضريبة القيمة المضافة على اجمالى الفاتورة',
                        ' (٥) ',
                        'يتم حساب خصم على اجمالى الفاتورة قبل حساب ضريبة القيمة المضافة يساوى (خمسين بالمائة) من قيمة الفاتورة و ذلك لمدة سنة واحدة من بداية تاريخ التعاقد الاول مع مقدم الخدمة الطبية',
                      ].join(' '),
                      style: textStyle,
                    ),
                  ],
                ),
                //# contract item 6 title
                pw.Row(
                  children: [
                    pw.Text(
                      'سادسا : انهاء التعاقد',
                      style: titleStyle,
                    ),
                  ],
                ),
                //# contract item 6 paragraph
                pw.Wrap(
                  children: [
                    pw.Text(
                      [
                        'يحق لكلا الطرفين إلغاء هذا الاتفاق بتقديم إشعار مدته (خمسة و اربعون يوما) يوم يتم إرساله عن طريق أيا من قنوات التواصل وإشهادا لما تقدم',
                        'وافق كلا الطرفين على البنود والشروط المذكورة في العقد',
                      ].join(' '),
                      style: textStyle,
                    ),
                  ],
                ),
                //# contract item 7 title
                pw.Row(
                  children: [
                    pw.Text(
                      'سابعا : الاختصاص',
                      style: titleStyle,
                    ),
                  ],
                ),
                //# contract item 7 paragraph
                pw.Wrap(
                  children: [
                    pw.Text(
                      [
                        'تختص محاكم القاهره بنظر المنازعات التي قد تنشا عن هذا العقد، ويعتجر عنوان كل طرف الموضح به موطنا مختارا في هذا الصدد',
                        'مالم يتم اخطار اى طرف الاخر كتابه بتغييره',
                      ].join(' '),
                      style: textStyle,
                    ),
                  ],
                ),
                ...signatureRows(
                  containerColor: containerColor,
                  containerHeight: containerHeight,
                  titleStyle: titleStyle,
                  subTitleStyle: subTitleStyle,
                  textStyle: textStyle,
                  signatureDate: signatureDate,
                  signatureImage: signatureImage,
                  result: result,
                ),
              ],
            ),
          ),
          ...footer,
        ],
      );
    },
  );
}
