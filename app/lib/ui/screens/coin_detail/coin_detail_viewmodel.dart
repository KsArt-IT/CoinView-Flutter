import 'package:coin_view/core/utils/result.dart';
import 'package:coin_view/data/api/coin_endpoint.dart';
import 'package:coin_view/domain/repositories/coin_repository.dart';
import 'package:flutter/material.dart';

final class CoinDetailViewModel extends ChangeNotifier {
  CoinDetailViewModel({required CoinRepository? repository})
      : _repository = repository;

  final CoinRepository? _repository;

  CoinDetail? _coinDetail;
  CoinDetail? get coinDetail => _coinDetail;

  String _message = '';
  String get message => _message;

  void fetchCoinDetail(String id) {
    if (_repository == null) {
      _showMessage("Repository is null");
      return;
    }

    _repository.fetchCoinDetail(id).then((result) {
      switch (result) {
        case Success(value: final data):
          _coinDetail = data as CoinDetail?;
        case Failure(error: final error):
          _showMessage(error.toString());
      }

      notifyListeners();
    });
  }

  void _showMessage(String message) {
    _message = message;
  }

  void clearMessage() {
    _message = '';
  }
}
