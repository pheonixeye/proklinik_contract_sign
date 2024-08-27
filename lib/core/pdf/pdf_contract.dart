// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:proklinik_contract_sign/assets/assets.dart';
import 'package:proklinik_contract_sign/core/pdf/page_one.dart';
import 'package:proklinik_contract_sign/core/pdf/page_two.dart';
import 'package:proklinik_models/models/doctor.dart';

class PdfContract {
  final Doctor doctor;
  PdfContract(this.doctor);

  late final pw.TtfFont ttf;

  late final pw.ImageProvider image;

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
    ttf = await fontFromAssetBundle(AppAssets.cairoFont);
    image = await imageFromAssetBundle(AppAssets.appLogo);

    return this;
  }

  final doc = pw.Document();

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
    );

    doc.addPage(page1);
    doc.addPage(page2);

    return doc.save();
  }
}
