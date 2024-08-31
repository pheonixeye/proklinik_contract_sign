// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proklinik_contract_sign/core/api/hx_contract.dart';
import 'package:proklinik_contract_sign/core/api/hx_documents.dart';
import 'package:proklinik_contract_sign/pages/contract_screen/contract_screen.dart';
import 'package:proklinik_contract_sign/pages/document_screen/document_screen.dart';
import 'package:proklinik_contract_sign/pages/loading_screen/loading_screen.dart';
import 'package:proklinik_contract_sign/pages/thankyou_screen/thankyou_screen.dart';
import 'package:proklinik_contract_sign/providers/px_contract_fetch.dart';
import 'package:proklinik_contract_sign/providers/px_documents.dart';
import 'package:proklinik_contract_sign/utils/utils_keys.dart';
import 'package:provider/provider.dart';

class AppRouter {
  AppRouter();

  static const String loading = '/';
  static const String contractId = 'contract/:id';
  static const String documentId = 'document/:id';
  static const String thankYou = 'thankyou';
}

final router = GoRouter(
  initialLocation: AppRouter.loading,
  navigatorKey: UtilsKeys.navigatorKey,
  routes: [
    GoRoute(
      path: AppRouter.loading,
      name: AppRouter.loading,
      builder: (context, state) {
        return LoadingScreen(
          key: state.pageKey,
        );
      },
      routes: [
        GoRoute(
          path: AppRouter.contractId,
          name: AppRouter.contractId,
          builder: (context, state) {
            final doc_id = state.pathParameters['id'];
            if (doc_id != null && doc_id.isNotEmpty) {
              final key = ValueKey(doc_id);
              return ChangeNotifierProvider(
                key: key,
                create: (context) => PxContractFetch(
                  contractService: HxContract(doc_id),
                ),
                child: ContractScreen(
                  key: state.pageKey,
                ),
              );
            }
            return Scaffold(
              key: state.pageKey,
              //TODO:
              body: const Center(
                child: Text('خطأ'),
              ),
            );
          },
        ),
        GoRoute(
          path: AppRouter.documentId,
          name: AppRouter.documentId,
          builder: (context, state) {
            final doc_id = state.pathParameters['id'];
            if (doc_id != null && doc_id.isNotEmpty) {
              final key = ValueKey(doc_id);
              return ChangeNotifierProvider(
                key: key,
                create: (context) => PxDocuments(
                  documentsService: HxDocuments(doc_id),
                ),
                child: DocumentScreen(
                  key: state.pageKey,
                ),
              );
            }
            return Scaffold(
              key: state.pageKey,
              //TODO:
              body: const Center(
                child: Text('خطأ'),
              ),
            );
          },
        ),
        GoRoute(
          path: AppRouter.thankYou,
          name: AppRouter.thankYou,
          builder: (context, state) {
            return ThankyouScreen(
              key: state.pageKey,
            );
          },
        ),
      ],
    ),
  ],
);
