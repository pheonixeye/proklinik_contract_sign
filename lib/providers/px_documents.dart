import 'package:flutter/material.dart';
import 'package:proklinik_contract_sign/core/api/hx_documents.dart';
import 'package:proklinik_contract_sign/models/document_server_response_model.dart';

class PxDocuments extends ChangeNotifier {
  final HxDocuments documentsService;

  PxDocuments({
    required this.documentsService,
  }) {
    fetchDocumentsOfOneDoctor();
  }

  final Map<String, String> documentKeys = {
    'national_id_card_front': 'صورة البطاقة الامامية',
    'national_id_card_back': "صورة البطاقة الخلفية",
    'practice_permit': "تصريح مزاولة المهنة",
    'syndicate_card': "كارنيه نقابة الاطباء",
    'specialist_cert': "شهادة الاخصائي",
    'consultant_cert': "شهادة الاستشاري",
  };

  DocumentServerResponseModel? _data;
  DocumentServerResponseModel? get data => _data;

  Future<void> fetchDocumentsOfOneDoctor() async {
    try {
      _data = await documentsService.checkIfDocumentExists();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addDoctorDocoument(String key, List<int> fileBytes) async {
    try {
      final doctorDocuments = await documentsService.addDocumentToDoctorDocs(
        id: _data!.documents.id,
        key: key,
        fileBytes: fileBytes,
      );
      _data = DocumentServerResponseModel(
        doctor: _data!.doctor,
        documents: doctorDocuments,
      );
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
