// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:proklinik_contract_sign/core/api/const.dart';
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
      if (_data!.contract.contract.isEmpty) {
        _state = ContractPageState.loadedUnSigned;
      } else {
        _state = ContractPageState.loadedSigned;
        setSignedContractUrl(
          _data!.contractResponse!,
          _data!.contract.contract,
        );
      }
      notifyListeners();
    } catch (e) {
      _data = null;
      _state = ContractPageState.error;
      notifyListeners();
    }
  }

  Uri? _signedContractUrl;
  Uri? get signedContractUrl => _signedContractUrl;

  void setSignedContractUrl(RecordModel contractRecord, String filename) {
    _signedContractUrl = PbHelper.pb.getFileUrl(contractRecord, filename);
    notifyListeners();
  }

  Future<Uint8List> fetchPdfFromUri() async {
    final result = await contractService
        .fetchPdfDataFromUri(_signedContractUrl.toString());
    return result;
  }

  ServerResponseModel? _data;
  ServerResponseModel? get data => _data;

  ContractPageState _state = ContractPageState.loading;
  ContractPageState get state => _state;

  Future<void> saveContractToDatabase({
    required String nationalId,
    required String arabicAddress,
    required String contractDate,
    required List<int> signature,
    required List<int> contract,
  }) async {
    await contractService.saveContractToDatabase(
      contractId: _data!.contract.id,
      nationalId: nationalId,
      arabicAddress: arabicAddress,
      contractDate: contractDate,
      signature: signature,
      contract: contract,
    );
  }
}

enum ContractPageState {
  loading,
  error,
  loadedSigned,
  loadedUnSigned;
}
