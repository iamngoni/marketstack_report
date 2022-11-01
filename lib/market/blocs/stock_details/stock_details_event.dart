part of 'stock_details_bloc.dart';

@immutable
abstract class StockDetailsEvent {}

class LoadStockDetails extends StockDetailsEvent {
  LoadStockDetails(this.stock, {this.from, this.to});
  final Stock stock;
  final DateTime? from;
  final DateTime? to;
}
