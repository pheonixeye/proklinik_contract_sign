// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:proklinik_contract_sign/assets/assets.dart';
import 'package:proklinik_contract_sign/core/pdf/page_four.dart';
import 'package:proklinik_contract_sign/core/pdf/page_one.dart';
import 'package:proklinik_contract_sign/core/pdf/page_three.dart';
import 'package:proklinik_contract_sign/core/pdf/page_two.dart';
import 'package:proklinik_contract_sign/models/contract_signature_result.dart';
import 'package:proklinik_models/models/doctor.dart';

class PdfContract {
  final Doctor doctor;
  PdfContract(this.doctor);

  late final pw.Font ttf;

  late final pw.ImageProvider image;

  late final pw.ImageProvider signatureImage;

  late final _logoStyle = pw.TextStyle(
    font: ttf,
    fontSize: 28,
    fontWeight: pw.FontWeight.bold,
  );

  final _containerColor = const PdfColor.fromInt(0xffACE1AF);

  final _containerHeight = 24.0;

  late final _titleStyle = pw.TextStyle(
    font: ttf,
    fontBold: ttf,
    fontSize: 22,
    fontWeight: pw.FontWeight.bold,
    color: const PdfColor.fromInt(0xff01411C),
  );

  late final _subTitleStyle = pw.TextStyle(
    font: ttf,
    fontBold: ttf,
    fontSize: 18,
    fontWeight: pw.FontWeight.bold,
    color: const PdfColor.fromInt(0xff49796B),
  );

  late final _textStyle = pw.TextStyle(
    font: ttf,
    fontBold: ttf,
    fontSize: 14,
    fontWeight: pw.FontWeight.normal,
    color: const PdfColor.fromInt(0xff00563B),
  );

  Future<PdfContract> init() async {
    ttf = await PdfGoogleFonts.cairoMedium();
    image = await imageFromAssetBundle(AppAssets.appLogo);
    signatureImage = await imageFromAssetBundle(AppAssets.signature);

    return this;
  }

  final String _signatureDate =
      DateFormat('dd/MM/yyyy', 'ar').format(DateTime.now());

  final unsignedContract = pw.Document();
  final signedContract = pw.Document();

  Future<Uint8List> signContract(
    PdfPageFormat context,
    ContractSignatureResult? result,
  ) async {
    final page1 = createPageOne(
      context: context,
      image: image,
      doctor: doctor,
      logoStyle: _logoStyle,
      textStyle: _textStyle,
      titleStyle: _titleStyle,
      subTitleStyle: _subTitleStyle,
      containerColor: _containerColor,
      containerHeight: _containerHeight,
      signatureDate: _signatureDate,
      signatureImage: signatureImage,
      result: result,
    );

    final page2 = createPageTwo(
      context: context,
      image: image,
      doctor: doctor,
      logoStyle: _logoStyle,
      textStyle: _textStyle,
      titleStyle: _titleStyle,
      subTitleStyle: _subTitleStyle,
      containerColor: _containerColor,
      containerHeight: _containerHeight,
      signatureDate: _signatureDate,
      signatureImage: signatureImage,
      result: result,
    );

    final page3 = createPageThree(
      context: context,
      image: image,
      doctor: doctor,
      logoStyle: _logoStyle,
      textStyle: _textStyle,
      titleStyle: _titleStyle,
      subTitleStyle: _subTitleStyle,
      containerColor: _containerColor,
      containerHeight: _containerHeight,
      signatureDate: _signatureDate,
      signatureImage: signatureImage,
      result: result,
    );

    final page4 = createPageFour(
      context: context,
      image: image,
      doctor: doctor,
      logoStyle: _logoStyle,
      textStyle: _textStyle,
      titleStyle: _titleStyle,
      subTitleStyle: _subTitleStyle,
      containerColor: _containerColor,
      containerHeight: _containerHeight,
      signatureDate: _signatureDate,
      signatureImage: signatureImage,
      result: result,
    );

    signedContract.addPage(page1);
    signedContract.addPage(page2);
    signedContract.addPage(page3);
    signedContract.addPage(page4);

    return signedContract.save();
  }

  Future<Uint8List> createContract(PdfPageFormat context) async {
    final page1 = createPageOne(
      context: context,
      image: image,
      doctor: doctor,
      logoStyle: _logoStyle,
      textStyle: _textStyle,
      titleStyle: _titleStyle,
      subTitleStyle: _subTitleStyle,
      containerColor: _containerColor,
      containerHeight: _containerHeight,
      signatureDate: _signatureDate,
      signatureImage: signatureImage,
    );

    final page2 = createPageTwo(
      context: context,
      image: image,
      doctor: doctor,
      logoStyle: _logoStyle,
      textStyle: _textStyle,
      titleStyle: _titleStyle,
      subTitleStyle: _subTitleStyle,
      containerColor: _containerColor,
      containerHeight: _containerHeight,
      signatureDate: _signatureDate,
      signatureImage: signatureImage,
    );

    final page3 = createPageThree(
      context: context,
      image: image,
      doctor: doctor,
      logoStyle: _logoStyle,
      textStyle: _textStyle,
      titleStyle: _titleStyle,
      subTitleStyle: _subTitleStyle,
      containerColor: _containerColor,
      containerHeight: _containerHeight,
      signatureDate: _signatureDate,
      signatureImage: signatureImage,
    );

    final page4 = createPageFour(
      context: context,
      image: image,
      doctor: doctor,
      logoStyle: _logoStyle,
      textStyle: _textStyle,
      titleStyle: _titleStyle,
      subTitleStyle: _subTitleStyle,
      containerColor: _containerColor,
      containerHeight: _containerHeight,
      signatureDate: _signatureDate,
      signatureImage: signatureImage,
    );

    unsignedContract.addPage(page1);
    unsignedContract.addPage(page2);
    unsignedContract.addPage(page3);
    unsignedContract.addPage(page4);

    return unsignedContract.save();
  }
}
