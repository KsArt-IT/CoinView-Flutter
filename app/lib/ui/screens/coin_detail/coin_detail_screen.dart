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
  String _name = '';

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args is String, "ID должен быть целым числом");
    _id = args as String;
    super.didChangeDependencies();
    if (_id.isNotEmpty) {
      _name = '';
      widget.viewModel.fetchCoinDetail(_id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_name)),
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
              _name = coinDetail.name;
              
              return SingleChildScrollView(
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
              ));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
