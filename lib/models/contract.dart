// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class Contract extends Equatable {
  final String id;
  final String doc_id;
  final String contract;
  const Contract({
    required this.id,
    required this.doc_id,
    required this.contract,
  });

  Contract copyWith({
    String? id,
    String? doc_id,
    String? contract,
  }) {
    return Contract(
      id: id ?? this.id,
      doc_id: doc_id ?? this.doc_id,
      contract: contract ?? this.contract,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'doc_id': doc_id,
      'contract': contract,
    };
  }

  factory Contract.fromJson(Map<String, dynamic> map) {
    return Contract(
      id: map['id'] as String,
      doc_id: map['doc_id'] as String,
      contract: map['contract'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, doc_id, contract];
}
