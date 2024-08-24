import 'package:flutter/material.dart';
import 'package:proklinik_contract_sign/core/localization/app_localizations.dart';
import 'package:proklinik_contract_sign/providers/_main.dart';
import 'package:proklinik_contract_sign/router/router.dart';
import 'package:proklinik_contract_sign/utils/utils_keys.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppProvider());
}

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MainProviders().providers,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: UtilsKeys.scaffoldMessengerKey,
      title: 'تعاقد مع بروكلينيك',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        fontFamily: 'Cairo',
        package: '/assets/fonts/cairo.ttf',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      locale: AppLocalizations.supportedLocales.first,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
