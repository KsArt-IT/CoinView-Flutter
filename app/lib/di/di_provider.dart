import 'package:coin_view/data/repositories/coin_repository_impl.dart';
import 'package:coin_view/data/service/coin_service.dart';
import 'package:coin_view/data/service/coin_service_impl.dart';
import 'package:coin_view/domain/repositories/coin_repository.dart';
import 'package:coin_view/ui/screens/viewmodels.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

interface class DIProvider {
  static List<SingleChildWidget> getProviders() {
    return [
      Provider<CoinService>(create: (_) => CoinServiceImpl()),
      ProxyProvider<CoinService, CoinRepository>(
        create: (_) => CoinRepositoryImpl(service: null),
        update: (_, service, previous) =>
            CoinRepositoryImpl(service: service),
      ),
      ChangeNotifierProxyProvider<CoinRepository, CoinsViewModel>(
        create: (_) => CoinsViewModel(repository: null), // Временное создание
        update: (_, repository, previous) =>
            CoinsViewModel(repository: repository),
      ),
      ChangeNotifierProxyProvider<CoinRepository, CoinDetailViewModel>(
        create: (_) => CoinDetailViewModel(repository: null), // Временное создание
        update: (_, repository, previous) =>
            CoinDetailViewModel(repository: repository),
      ),
    ];
  }
}
