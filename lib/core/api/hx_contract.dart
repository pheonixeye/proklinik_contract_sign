import 'package:pocketbase/pocketbase.dart';
import 'package:proklinik_contract_sign/core/api/const.dart';
import 'package:proklinik_contract_sign/models/contract.dart';
import 'package:proklinik_contract_sign/models/server_response_model.dart';
import 'package:proklinik_contract_sign/utils/dprint.dart';
import 'package:proklinik_models/models/doctor.dart';

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
}
