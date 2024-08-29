import 'dart:typed_data';

import 'package:http_parser/http_parser.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:proklinik_contract_sign/core/api/const.dart';
import 'package:proklinik_contract_sign/models/contract.dart';
import 'package:proklinik_contract_sign/models/server_response_model.dart';
import 'package:proklinik_contract_sign/utils/dprint.dart';
import 'package:proklinik_models/models/doctor.dart';
import 'package:http/http.dart' as http;

class HxContract {
  const HxContract(this.doc_id);
  // ignore: non_constant_identifier_names
  final String doc_id;

  Future<ServerResponseModel?> checkIfContractDocumentExists() async {
    late final Doctor doctor;
    try {
      final response = await PbHelper.pb.collection('doctors').getOne(doc_id);
      doctor = Doctor.fromJson(response.toJson());
    } on ClientException catch (e) {
      dprint('doctor id not found. ${e.response}');
      rethrow;
    }

    try {
      final response =
          await PbHelper.pb.collection('contracts').getFirstListItem(
                "doc_id = '$doc_id'",
              );
      final contract = Contract.fromJson(response.toJson());

      dprint('doctor id found, contract found.');
      return ServerResponseModel(
        contract: contract,
        doctor: doctor,
        contractResponse: response,
      );
    } catch (e) {
      final response = await PbHelper.pb.collection('contracts').create(
        body: {
          'doc_id': doc_id,
        },
      );
      final contract = Contract.fromJson(response.toJson());
      dprint('doctor id found, contract created.');
      return ServerResponseModel(
        contract: contract,
        doctor: doctor,
      );
    }
  }

  Future<void> saveContractToDatabase({
    required String contractId,
    required String nationalId,
    required String arabicAddress,
    required String contractDate,
    required List<int> signature,
    required List<int> contract,
  }) async {
    final n = DateTime.now();
    await PbHelper.pb.collection('contracts').update(
      contractId,
      body: {
        'national_id': nationalId,
        'arabic_address': arabicAddress,
        'contract_date': contractDate,
      },
      files: [
        http.MultipartFile.fromBytes(
          'signature',
          signature,
          filename: 'signature${n.day}${n.month}${n.year}.png',
          contentType: MediaType.parse('image/png'),
        ),
        http.MultipartFile.fromBytes(
          'contract',
          contract,
          filename: 'contract${n.day}${n.month}${n.year}.pdf',
          contentType: MediaType.parse('application/pdf'),
        ),
      ],
    );
  }

  Future<Uint8List> fetchPdfDataFromUri(String path) async {
    final response = await http.get(Uri.parse(path));
    return response.bodyBytes;
  }
}
