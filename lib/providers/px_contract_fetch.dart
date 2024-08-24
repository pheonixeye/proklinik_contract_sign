// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:proklinik_contract_sign/core/api/hx_contract.dart';
import 'package:proklinik_contract_sign/models/server_response_model.dart';

class PxContractFetch extends ChangeNotifier {
  PxContractFetch({
    required this.contractService,
  }) {
    _init();
  }

  final HxContract contractService;

  void _init() async {
    try {
      _data = await contractService.checkIfContractDocumentExists();
      _state = ContractPageState.loaded;
      notifyListeners();
    } catch (e) {
      _data = null;
      _state = ContractPageState.error;
      notifyListeners();
    }
  }

  ServerResponseModel? _data;
  ServerResponseModel? get data => _data;

  ContractPageState _state = ContractPageState.loading;
  ContractPageState get state => _state;
}

enum ContractPageState {
  loading,
  error,
  loaded;
}
