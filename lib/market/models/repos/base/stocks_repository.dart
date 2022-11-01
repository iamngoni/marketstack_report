import 'package:dartz/dartz.dart';

import '../../../../core/models/app_exception.dart';
import '../../data/stock.dart';
import '../../data/stock_details.dart';

abstract class StocksRepository {
  Future<Either<AppException, List<Stock>>> getStocks();
  Future<Either<AppException, StockDetails>> getStockDetails(
    Stock stock, {
    DateTime? from,
    DateTime? to,
  });
}
