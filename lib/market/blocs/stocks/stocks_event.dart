part of 'stocks_bloc.dart';

@immutable
abstract class StocksEvent {}

class LoadStocks extends StocksEvent {}

class FilterStocks extends StocksEvent {
  FilterStocks(this.query);
  final String query;
}
