
import 'package:coin_view/router/router.dart';
import 'package:flutter/material.dart';

class CoinListScreen extends StatefulWidget {
  @override
  State<CoinListScreen> createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главный экран')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            int id = 42;
            AppRoute.navigateTo(context, AppRoute.detail, id: id);
          },
          child: const Text('Перейти к деталям'),
        ),
      ),
    );
  }
}
