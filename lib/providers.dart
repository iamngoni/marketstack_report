import 'package:flutter_bloc/flutter_bloc.dart';

import 'market/blocs/connectivity_status/connectivity_status_bloc.dart';
import 'market/blocs/stocks/stocks_bloc.dart';
import 'market/models/repos/impl/istocks_repository.dart';

List<BlocProvider> providers = [
  BlocProvider<ConnectivityStatusBloc>(
    create: (_) => ConnectivityStatusBloc(),
  ),
  BlocProvider<StocksBloc>(
    create: (_) =>
        StocksBloc(repository: StocksRepositoryImpl())..add(LoadStocks()),
  ),
];
