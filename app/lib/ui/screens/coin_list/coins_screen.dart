import 'package:coin_view/router/router.dart';
import 'package:coin_view/ui/screens/coin_list/coins_viewmodel.dart';
import 'package:coin_view/ui/widgets/snackbar_ext.dart';
import 'package:flutter/material.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({super.key, required this.viewModel});
  final CoinsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главный экран')),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            if (viewModel.message.isNotEmpty) {
              Future.microtask(() {
                context.showSnackbar(viewModel.message);
                viewModel.clearMessage();
              });
            }

            return ListView.builder(
              itemCount: viewModel.coins.length,
              itemBuilder: (context, index) {
                final coin = viewModel.coins[index];

                return ListTile(
                  leading: Image.network(
                          coin.logoUrl,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.image);
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const CircularProgressIndicator();
                          },
                        ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(coin.name),
                  subtitle: Text("${coin.rank} ${coin.symbol}"),
                  onTap: () {
                    AppRoute.navigateTo(context, AppRoute.detail, id: coin.id);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
