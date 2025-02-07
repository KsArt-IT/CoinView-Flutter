import 'package:coin_view/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CoinViewApp extends StatelessWidget {
  const CoinViewApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin View',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
