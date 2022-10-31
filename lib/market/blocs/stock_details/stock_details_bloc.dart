import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/models/app_exception.dart';
import '../../models/data/stock.dart';
import '../../models/data/stock_details.dart';
import '../../models/repos/base/stocks_repository.dart';

part 'stock_details_event.dart';
part 'stock_details_state.dart';

class StockDetailsBloc extends Bloc<StockDetailsEvent, StockDetailsState> {
  StockDetailsBloc({
    required this.repository,
  }) : super(StockDetailsInitial()) {
    on<StockDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final StocksRepository repository;
}
