import 'package:flutter/material.dart';
import 'package:proklinik_contract_sign/pages/contract_screen/widgets/contract_preview_page.dart';
import 'package:proklinik_contract_sign/providers/px_contract_fetch.dart';
import 'package:proklinik_contract_sign/widgets/central_loading.dart';
import 'package:provider/provider.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PxContractFetch>(
      builder: (context, c, _) {
        return Scaffold(
          body: switch (c.state) {
            ContractPageState.loading => const CentralLoading(),
            ContractPageState.error => const Center(
                child: Text('خطأ'),
              ),
            ContractPageState.loaded =>
              ContractPreviewPage(doctor: c.data!.doctor),
          },
        );
      },
    );
  }
}
