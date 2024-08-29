import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:proklinik_contract_sign/providers/px_contract_fetch.dart';
import 'package:proklinik_contract_sign/widgets/central_loading.dart';
import 'package:provider/provider.dart';

class SignedContractPreviewPage extends StatefulWidget {
  const SignedContractPreviewPage({super.key});

  @override
  State<SignedContractPreviewPage> createState() =>
      _SignedContractPreviewPageState();
}

class _SignedContractPreviewPageState extends State<SignedContractPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<PxContractFetch>(
          builder: (context, c, _) {
            while (c.signedContractUrl == null) {
              return const CentralLoading();
            }
            return FutureBuilder<Uint8List>(
              future: c.fetchPdfFromUri(),
              builder: (context, snapshot) {
                while (!snapshot.hasData) {
                  return const CentralLoading();
                }
                return PdfPreview(
                  build: (context) {
                    return snapshot.data!;
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
