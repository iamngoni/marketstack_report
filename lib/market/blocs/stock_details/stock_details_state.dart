part of 'stock_details_bloc.dart';

@immutable
abstract class StockDetailsState {}

class StockDetailsInitial extends StockDetailsState {}

class StockDetailsLoading extends StockDetailsState {}

class StockDetailsLoaded extends StockDetailsState {
  StockDetailsLoaded(this.stockDetails);
  final StockDetails stockDetails;
}

class StockDetailsException extends StockDetailsState {
  StockDetailsException(this.exception);
  final AppException exception;
}
