import 'package:coin_view/router/router.dart';
import 'package:coin_view/ui/screens/coin_detail/coin_detail_viewmodel.dart';
import 'package:coin_view/ui/widgets/snackbar_ext.dart';
import 'package:flutter/material.dart';

class CoinDetailScreen extends StatefulWidget {
  const CoinDetailScreen({super.key, required this.viewModel});
  final CoinDetailViewModel viewModel;

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  late String _id;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args is String, "ID должен быть целым числом");
    _id = args as String;
    super.didChangeDependencies();
    if (_id.isNotEmpty) {
      widget.viewModel.fetchCoinDetail(_id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Детали #$_id')),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, _) {
            if (widget.viewModel.message.isNotEmpty) {
               Future.microtask(() {
                context.showSnackbar(widget.viewModel.message);
                widget.viewModel.clearMessage();
              });
            }

            final coinDetail = widget.viewModel.coinDetail;
            if (coinDetail != null) {
              return Center(child: Text(coinDetail.name));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
