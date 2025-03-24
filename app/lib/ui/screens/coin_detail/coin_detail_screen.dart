import 'package:coin_view/ui/screens/coin_detail/coin_detail_viewmodel.dart';
import 'package:coin_view/ui/widgets/snackbar_ext.dart';
import 'package:flutter/material.dart';

class CoinDetailScreen extends StatelessWidget {
  final CoinDetailViewModel viewModel;

  CoinDetailScreen({
    super.key,
    required this.viewModel,
    required id,
  }) {
    viewModel.fetchCoinDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        if (viewModel.message.isNotEmpty) {
          Future.microtask(() {
            context.showSnackbar(viewModel.message);
            viewModel.clearMessage();
          });
        }
        final coinDetail = viewModel.coinDetail;
        if (coinDetail != null) {
          return Scaffold(
            appBar: AppBar(title: Text(coinDetail.name)),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Image.network(
                      coinDetail.logoURL,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, _, __) {
                        return Image.asset("assets/images/coin_logo.png");
                      },
                    ),
                    Text(coinDetail.name),
                    Text(coinDetail.symbol),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("First date: "),
                        Text(coinDetail.firstDataAt),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Last date: "),
                        Text(coinDetail.lastDataAt),
                      ],
                    ),
                    Divider(),
                    Text("Team"),
                    Text(coinDetail.team),
                    Divider(),
                    Text("Tags"),
                    Text(coinDetail.tags),
                    Divider(),
                    Text(coinDetail.message),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(title: const Text("")),
          body: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
