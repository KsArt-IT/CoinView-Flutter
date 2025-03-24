import 'package:coin_view/core/utils/result.dart';
import 'package:coin_view/domain/models/coin_detail.dart';
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
    if (_coinDetail != null && _coinDetail!.id == id) return;
    
    _repository.fetchCoinDetail(id).then((result) {
      switch (result) {
        case Success(value: final data):
          _setCoin(data);
        case Failure(error: final error):
          _showMessage(error.toString());
      }

      notifyListeners();
    });
  }

  void _setCoin(CoinDetail coinDetail) {
    _coinDetail = coinDetail;
  }

  void _showMessage(String message) {
    _message = message;
  }

  void clearMessage() {
    _message = '';
  }
}
