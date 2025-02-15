import 'dart:collection';

import 'package:coin_view/core/utils/result.dart';
import 'package:coin_view/domain/models/coin.dart';
import 'package:coin_view/domain/repositories/coin_repository.dart';
import 'package:flutter/foundation.dart';

class CoinsViewModel extends ChangeNotifier {
  CoinsViewModel({
    required CoinRepository? repository,
  }) : _repository = repository {
    fetchCoins();
  }

  final CoinRepository? _repository;

  List<Coin> _coins = [];
  UnmodifiableListView<Coin> get coins => UnmodifiableListView(_coins);

  String _message = '';
  String get message => _message;

  void fetchCoins() {
    debugPrint("CoinsViewModel:fetchCoins");
    if (_repository == null) {
      _showMessage("Repository is null");
      return;
    }
    _repository.fetchCoins().then((coins) {
      switch (coins) {
        case Success(value: final data):
          _setCoins(data);
        case Failure(error: final error):
          _showMessage(error.toString());
      }
      notifyListeners();
    });
  }

  void _setCoins(List<Coin> coins) {
    _coins = coins;
  }

  void _showMessage(String message) {
    _message = message;
  }

  void clearMessage() {
    _message = '';
  }
}
