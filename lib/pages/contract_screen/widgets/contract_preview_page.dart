import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:proklinik_contract_sign/core/pdf/pdf_contract.dart';
import 'package:proklinik_contract_sign/widgets/central_loading.dart';
import 'package:proklinik_models/models/doctor.dart';

class ContractPreviewPage extends StatefulWidget {
  const ContractPreviewPage({super.key, required this.doctor});
  final Doctor doctor;

  @override
  State<ContractPreviewPage> createState() => _ContractPreviewPageState();
}

class _ContractPreviewPageState extends State<ContractPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PdfPreview(
          allowSharing: false,
          dpi: 144,
          loadingWidget: const CentralLoading(),
          useActions: false,
          build: (context) async {
            // ignore: no_leading_underscores_for_local_identifiers
            final _contract = await PdfContract(widget.doctor).init();
            return _contract.createContract(context);
          },
        ),
      ),
    );
  }
}
