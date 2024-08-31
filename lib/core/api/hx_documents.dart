import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';
import 'package:proklinik_contract_sign/core/api/const.dart';
import 'package:proklinik_contract_sign/models/document_server_response_model.dart';
import 'package:proklinik_contract_sign/utils/dprint.dart';
import 'package:proklinik_models/models/doctor.dart';

const documents = 'documents';

class HxDocuments {
  HxDocuments(this.docId);

  final String docId;

  Future<DocumentServerResponseModel> checkIfDocumentExists() async {
    late final Doctor doctor;
    try {
      final response = await PbHelper.pb.collection('doctors').getOne(docId);
      doctor = Doctor.fromJson(response.toJson());
    } on ClientException catch (e) {
      dprint('doctor id not found. ${e.response}');
      rethrow;
    }
    try {
      final result = await PbHelper.pb
          .collection(documents)
          .getFirstListItem("doc_id = '$docId'");
      return DocumentServerResponseModel(
        doctor: doctor,
        documents: result,
      );
    } on ClientException catch (e) {
      if (kDebugMode) {
        print(e.response['message']);
      }
      try {
        final result = await PbHelper.pb.collection(documents).create(
          body: {
            'doc_id': docId,
          },
        );
        return DocumentServerResponseModel(
          doctor: doctor,
          documents: result,
        );
      } on ClientException catch (e) {
        throw Exception(e.response['message']);
      }
    }
  }

  Future<RecordModel> addDocumentToDoctorDocs({
    required String id,
    required String key,
    required List<int> fileBytes,
  }) async {
    try {
      final doctorDocuments = await PbHelper.pb.collection(documents).update(
        id,
        files: [
          http.MultipartFile.fromBytes(
            key,
            fileBytes,
            filename: key,
          ),
        ],
      );
      return doctorDocuments;
    } on ClientException catch (e) {
      throw Exception(e.response['message']);
    }
  }

  static Future<Uri> getFileUrl(String id, String key) async {
    try {
      final record = await PbHelper.pb.collection(documents).getOne(id);
      final docKey = record.getStringValue(key);
      final uri = PbHelper.pb.files.getUrl(record, docKey);
      return uri;
    } on ClientException catch (e) {
      throw Exception(e.response['message']);
    }
  }
}
