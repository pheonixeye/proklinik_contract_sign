import 'package:equatable/equatable.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:proklinik_contract_sign/models/contract.dart';
import 'package:proklinik_models/models/doctor.dart';

class ServerResponseModel extends Equatable {
  final Contract contract;
  final Doctor doctor;
  final RecordModel? contractResponse;

  const ServerResponseModel({
    required this.contract,
    required this.doctor,
    this.contractResponse,
  });

  ServerResponseModel copyWith({
    Contract? contract,
    Doctor? doctor,
  }) {
    return ServerResponseModel(
      contract: contract ?? this.contract,
      doctor: doctor ?? this.doctor,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'contract': contract.toJson(),
      'doctor': doctor.toJson(),
    };
  }

  factory ServerResponseModel.fromJson(Map<String, dynamic> map) {
    return ServerResponseModel(
      contract: Contract.fromJson(map['contract'] as Map<String, dynamic>),
      doctor: Doctor.fromJson(map['doctor'] as Map<String, dynamic>),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [contract, doctor];
}
