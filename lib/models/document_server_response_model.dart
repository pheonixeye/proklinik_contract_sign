// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:pocketbase/pocketbase.dart';

import 'package:proklinik_models/models/doctor.dart';

class DocumentServerResponseModel extends Equatable {
  final RecordModel documents;
  final Doctor doctor;

  const DocumentServerResponseModel({
    required this.documents,
    required this.doctor,
  });

  @override
  List<Object?> get props => [documents, doctor];
}
