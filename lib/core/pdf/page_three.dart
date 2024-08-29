import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:proklinik_contract_sign/core/pdf/logo_header_footer.dart';
import 'package:proklinik_contract_sign/core/pdf/signature_section.dart';
import 'package:proklinik_contract_sign/models/contract_signature_result.dart';
import 'package:proklinik_models/models/doctor.dart';

pw.Page createPageThree({
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
                //# contract item 4 title
                pw.Row(
                  children: [
                    pw.Text(
                      'رابعا: شروط اخرى',
                      style: titleStyle,
                    ),
                  ],
                ),
                //# contract item 4 paragraph
                pw.Wrap(
                  children: [
                    pw.Text(
                      [
                        '(١) ',
                        'في حالة تخلف المريض عن الموعد المحدد له، يقوم الطرف الثانى “الطبيب“ بالضغط على زر التخلف عن الحضور لإلغاء تكلفةالكشف',
                        ' (٢) ',
                        'فى حالة حضور المريض في الموعد المحدد له وتخلف الطرف الثانى “الطبيب“ عن الموعد دون إبلاغ الطرف الأول، يتحمل الطرف الثانى تكلفة الكشف على حسابه الشخصى',
                        ' (٣) ',
                        'يختار الطرف الثانى طريقة الاشتراك الملائمة له من الاختيارات المتاحة وكذلك طريقة السداد',
                        ' (٤) ',
                        ' يتلقي الطرف الثاني الدعم الفني والإجابة على استفساراته وتساؤلاته خلال (٢٤) ساعة',
                        ' (٥) ',
                        'يحق لبروكلينيك استخدام البيانات المدرجة من الطبيب واستخدامها وتعديلها بغرض عمل الدعاية الالزمة على قنواتها وشركائها.',
                        ' (٦) ',
                        'لا يمكن استخدام بيانات المريض او صورهم الشخصية او بيان حالتهم الي أغراض دعائية وفى حال حدوث ذلك لا تكون بروكلينيك مسؤولة',
                        ' (٧) ',
                        'يحق لبروكلينيك فسخ التعاقد دون الحاجة إلى إنذار أو إخطار في حال استخدام الطبيب طرق غير سليمة من شأنها اﻻنتقاص من الحقوق المالية لشركة بروكلينيك',
                        ' (٨) ',
                        ' يحق لبروكلينيك تعديل أسعار الخدمات التي تقدمها عبر تطبيقاتها وفقا لتقديرها كلما لزم الامر في خلال مدة العقد مع إخطار الطباء المشتركين بقيمة التغيير',
                        ' (٩) ',
                        'يحق لبروكلينيك إخفاء وشطب أى حسابات في حالة قيامها باستغلال الثغرات البرمجية او إساءة الاستخدام او محاولة ترقية التقييمات بالمخالفة للواقع او من خلال اشخاص غير المرضى المستخدمين للتطبيق',
                        ' (١٠) ',
                        'يقر ويتعهد الطبيب انه حصل على كافة الشهادات والتصاريح والتراخيص الالزمة لمزاولة مهنة الطب كما انه يمارس مهنة الطب من خلال عيادة او مركز طبي مرخص',
                        ' (١١) ',
                        'يتم تعديل الشروط والاحكام الخاصة بالتطبيقات عن طريق الانترنت في بند سياسة الشروط والاحكام ويعتد بهذه التعديلات كلما كان تاريخها أحدث من سابقتها وأحدث من تاريخ هذا التعاقد',
                        ' (١٢) ',
                        'الطبيب مسئول مسئولية طبية ومدنية وجنائية عن أى اضرار او مضاعفات او اعراض جانبية تحدث للمرضي نتيجة لتشخيص او علاج',
                        ' (١٣) ',
                        'هذا العقد سارى لمده سنه ويجدد تلقائيا إذا لم يبلغ أحد الطرفين قبل انتهاء مدته ويسمح لكلاً من الطرفين إنهاء العقد فى أى وقت',
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
