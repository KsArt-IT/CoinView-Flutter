import 'package:coin_view/router/router.dart';
import 'package:coin_view/ui/theme/app_theme.dart';
import 'package:coin_view/ui/widgets/snackbar_ext.dart';
import 'package:flutter/material.dart';

class CoinViewApp extends StatelessWidget {
  const CoinViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin View',
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoute.coins.route,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
