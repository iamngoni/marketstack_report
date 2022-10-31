import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stocks_event.dart';
part 'stocks_state.dart';

class StocksBloc extends Bloc<StocksEvent, StocksState> {
  StocksBloc() : super(StocksInitial()) {
    on<StocksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
