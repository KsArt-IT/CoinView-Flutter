import 'package:coin_view/ui/theme/theme.dart';
import 'package:coin_view/router/router.dart';
import 'package:flutter/material.dart';

class CoinViewApp extends StatelessWidget {
  const CoinViewApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin View',
      theme: lightTheme,
      initialRoute: AppRoute.coins.route,
      routes: AppRoute.routes,
    );
  }
}
