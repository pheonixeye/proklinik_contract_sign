import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:proklinik_contract_sign/providers/px_contract_fetch.dart';
import 'package:proklinik_contract_sign/widgets/central_loading.dart';
import 'package:provider/provider.dart';

import 'dart:html' as html; // ignore: avoid_web_libraries_in_flutter

class SignedContractPreviewPage extends StatefulWidget {
  const SignedContractPreviewPage({super.key});

  @override
  State<SignedContractPreviewPage> createState() =>
      _SignedContractPreviewPageState();
}

class _SignedContractPreviewPageState extends State<SignedContractPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PxContractFetch>(
      builder: (context, c, _) {
        final Future<Uint8List> contractFileBytes = c.fetchPdfFromUri();
        while (c.signedContractUrl == null) {
          return const CentralLoading();
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<Uint8List>(
              future: contractFileBytes,
              builder: (context, snapshot) {
                while (!snapshot.hasData) {
                  return const CentralLoading(
                    loadingText: 'جاري تحميل العقد...',
                  );
                }
                return PdfPreview(
                  allowSharing: false,
                  dpi: 144,
                  loadingWidget: const CentralLoading(),
                  useActions: false,
                  build: (context) {
                    return snapshot.data!;
                  },
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              html.window.open(c.signedContractUrl.toString(), '', '_blank');
            },
            label: const Text('تنزيل العقد'),
            icon: const Icon(Icons.download),
          ),
        );
      },
    );
  }
}
