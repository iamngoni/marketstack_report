part of 'stocks_bloc.dart';

@immutable
abstract class StocksState {}

class StocksInitial extends StocksState {}

class StocksLoading extends StocksState {}

class StocksLoaded extends StocksState {
  StocksLoaded({required this.stocks, this.filteredList = const []});
  final List<Stock> stocks;
  final List<Stock> filteredList;
}

class StocksException extends StocksState {
  StocksException(this.exception);
  final AppException exception;
}
