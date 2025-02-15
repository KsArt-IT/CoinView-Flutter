import 'package:coin_view/app/coin_view_app.dart';
import 'package:coin_view/di/di_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: DIProvider.getProviders(),
        child: const CoinViewApp()),
  );
}
