import 'package:flutter/material.dart';
import 'package:proklinik_contract_sign/widgets/central_loading.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CentralLoading(),
    );
  }
}
