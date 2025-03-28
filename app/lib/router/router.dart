import 'package:flutter/material.dart';
import 'package:coin_view/ui/screens/screens.dart';
import 'package:provider/provider.dart';

enum AppRoute {
  coins(_coinsRoute),
  detail(_detailRoute);

  final String route;

  const AppRoute(this.route);

  static const _coinsRoute = '/coin_list';
  static const _detailRoute = '/coin_detail';

  static void navigateTo(BuildContext context, AppRoute route, {String? id}) {
    if (id != null) {
      Navigator.of(context).pushNamed(route.route, arguments: id);
    } else {
      Navigator.of(context).pushNamed(route.route);
    }
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) =>
      switch (settings.name) {
        _coinsRoute => MaterialPageRoute(
            builder: (context) => CoinsScreen(viewModel: context.read()),
          ),
        _detailRoute => MaterialPageRoute(
            builder: (context) => CoinDetailScreen(
              viewModel: context.read(),
              id: settings.arguments as String,
            ),
          ),
        _ => null,
      };
}
