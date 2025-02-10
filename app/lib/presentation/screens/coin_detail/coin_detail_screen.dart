import 'package:coin_view/router/router.dart';
import 'package:flutter/material.dart';

class CoinDetailScreen extends StatefulWidget {

  const CoinDetailScreen({super.key});

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  late int _id;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args is int, "ID должен быть целым числом");
    _id = args as int;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Детали #$_id')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: $_id', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => AppRoute.goBack(context),
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
