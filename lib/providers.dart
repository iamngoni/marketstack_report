import 'package:flutter_bloc/flutter_bloc.dart';

import 'market/blocs/connectivity_status/connectivity_status_bloc.dart';

List<BlocProvider> providers = [
  BlocProvider<ConnectivityStatusBloc>(
    create: (_) => ConnectivityStatusBloc(),
  ),
];
