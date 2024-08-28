// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class Contract extends Equatable {
  final String id;
  final String doc_id;
  final String contract_date;
  final String national_id;
  final String arabic_address;
  final String signature;
  final String contract;

  const Contract({
    required this.id,
    required this.doc_id,
    required this.contract_date,
    required this.national_id,
    required this.arabic_address,
    required this.signature,
    required this.contract,
  });

  Contract copyWith({
    String? id,
    String? doc_id,
    String? contract_date,
    String? national_id,
    String? arabic_address,
    String? signature,
    String? contract,
  }) {
    return Contract(
      id: id ?? this.id,
      doc_id: doc_id ?? this.doc_id,
      contract_date: contract_date ?? this.contract_date,
      national_id: national_id ?? this.national_id,
      arabic_address: arabic_address ?? this.arabic_address,
      signature: signature ?? this.signature,
      contract: contract ?? this.contract,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'doc_id': doc_id,
      'contract_date': contract_date,
      'national_id': national_id,
      'arabic_address': arabic_address,
      'signature': signature,
      'contract': contract,
    };
  }

  factory Contract.fromJson(Map<String, dynamic> map) {
    return Contract(
      id: map['id'] as String,
      doc_id: map['doc_id'] as String,
      contract_date: map['contract_date'] as String,
      national_id: map['national_id'] as String,
      arabic_address: map['arabic_address'] as String,
      signature: map['signature'] as String,
      contract: map['contract'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      doc_id,
      contract_date,
      national_id,
      arabic_address,
      signature,
      contract,
    ];
  }
}
