part of 'stock_details_bloc.dart';

@immutable
abstract class StockDetailsEvent {}

class LoadStockDetails extends StockDetailsEvent {
  LoadStockDetails(this.stock);
  final Stock stock;
}
