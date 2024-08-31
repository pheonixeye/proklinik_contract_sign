import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:proklinik_contract_sign/core/pdf/pdf_contract.dart';
import 'package:proklinik_contract_sign/models/contract_signature_result.dart';
import 'package:proklinik_contract_sign/pages/contract_screen/widgets/contract_sign_dialog.dart';
import 'package:proklinik_contract_sign/providers/px_contract_fetch.dart';
import 'package:proklinik_contract_sign/router/router.dart';
import 'package:proklinik_contract_sign/widgets/central_loading.dart';
import 'package:proklinik_models/models/doctor.dart';
import 'package:provider/provider.dart';

class ContractPreviewPage extends StatefulWidget {
  const ContractPreviewPage({super.key, required this.doctor});
  final Doctor doctor;

  @override
  State<ContractPreviewPage> createState() => _ContractPreviewPageState();
}

class _ContractPreviewPageState extends State<ContractPreviewPage> {
  late final PdfContract _contract;

  final PdfPageFormat _format = PdfPageFormat.a4;

  FutureOr<Uint8List>? _contractPreview;

  ContractSignatureResult? _contractSignatureResult;

  @override
  void initState() {
    super.initState();
    _initContract();
  }

  void _initContract() async {
    _contract = await PdfContract(widget.doctor).init();
    _contractPreview = await _contract.createContract(_format);
    setState(() {});
  }

  Future<void> _signContract() async {
    _contractPreview = await _contract.signContract(
      _format,
      _contractSignatureResult,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(
          builder: (context) {
            while (_contractPreview == null) {
              return const CentralLoading();
            }
            return PdfPreview(
              allowSharing: false,
              dpi: 144,
              loadingWidget: const CentralLoading(),
              useActions: false,
              build: (context) async {
                return _contractPreview!;
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          _contractSignatureResult = await showDialog<ContractSignatureResult?>(
            barrierDismissible: false,
            context: context,
            builder: (context) => const ContractSignDialog(),
          );
          if (_contractSignatureResult != null && context.mounted) {
            //todo: show loading
            BuildContext? loadingContext;

            showDialog(
              context: context,
              builder: (context) {
                loadingContext = context;
                return const CentralLoading(
                  loadingText: 'جاري تنسيق امضاء العقد...',
                );
              },
            );
            //todo: modify contract pages
            await _signContract();

            //todo: save contract to database
            if (context.mounted) {
              await context.read<PxContractFetch>().saveContractToDatabase(
                    nationalId: _contractSignatureResult!.national_id,
                    arabicAddress: _contractSignatureResult!.arabic_address,
                    contractDate: _contractSignatureResult!.contract_date,
                    signature: _contractSignatureResult!.signature!,
                    contract: await _contractPreview!,
                  );
            }

            //todo: dismiss loading
            if (loadingContext != null) {
              if (loadingContext!.mounted) {
                Navigator.pop(loadingContext!);
              }
            }
            //todo: navigate to thankyou page
            if (context.mounted) {
              GoRouter.of(context).goNamed(
                AppRouter.thankYou,
                pathParameters: {
                  'id': context.read<PxContractFetch>().data!.doctor.id,
                },
              );
            }
          } else {
            return;
          }
        },
        label: const Text('توقيع العقد'),
        icon: const Icon(Icons.edit_square),
      ),
    );
  }
}
