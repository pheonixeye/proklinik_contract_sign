import 'package:go_router/go_router.dart';
import 'package:proklinik_contract_sign/pages/contract_screen/contract_screen.dart';
import 'package:proklinik_contract_sign/pages/loading_screen/loading_screen.dart';
import 'package:proklinik_contract_sign/pages/thankyou_screen/thankyou_screen.dart';
import 'package:proklinik_contract_sign/utils/utils_keys.dart';

class AppRouter {
  AppRouter();

  static const String loading = '/';
  static const String contractId = ':id';
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
            return ContractScreen(
              key: state.pageKey,
            );
          },
          routes: [
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
    ),
  ],
);
