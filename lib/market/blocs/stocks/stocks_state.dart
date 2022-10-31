part of 'stocks_bloc.dart';

@immutable
abstract class StocksState {}

class StocksInitial extends StocksState {}

class StocksLoading extends StocksState {}

class StocksLoaded extends StocksState {
  StocksLoaded(this.stocks);
  final List<Stock> stocks;
}

class StocksException extends StocksState {
  StocksException(this.exception);
  final AppException exception;
}
