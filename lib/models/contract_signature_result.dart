// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class ContractSignatureResult extends Equatable {
  final String contract_date = DateTime.now().toIso8601String();
  final String arabic_address;
  final String national_id;
  final Uint8List? signature;

  ContractSignatureResult({
    required this.arabic_address,
    required this.national_id,
    required this.signature,
  });

  ContractSignatureResult copyWith({
    String? contract_date,
    String? arabic_address,
    String? national_id,
    Uint8List? signature,
  }) {
    return ContractSignatureResult(
      arabic_address: arabic_address ?? this.arabic_address,
      national_id: national_id ?? this.national_id,
      signature: signature ?? this.signature,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'arabic_address': arabic_address,
      'national_id': national_id,
      'signature': signature,
    };
  }

  factory ContractSignatureResult.fromJson(Map<String, dynamic> map) {
    return ContractSignatureResult(
      arabic_address: map['arabic_address'] as String,
      national_id: map['national_id'] as String,
      signature: map['signature'] as Uint8List?,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        contract_date,
        arabic_address,
        national_id,
        signature,
      ];
}
