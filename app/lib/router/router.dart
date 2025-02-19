import 'package:flutter/material.dart';
import 'package:coin_view/ui/screens/screens.dart';
import 'package:provider/provider.dart';

enum AppRoute {
  coins("/coin_list"),
  detail("/coin_detail");

  final String route;

  const AppRoute(this.route);

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

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoute.coins.route: (context) => CoinsScreen(viewModel: context.read()),
      AppRoute.detail.route: (context) => CoinDetailScreen(viewModel: context.read()),
    };
  }
}
