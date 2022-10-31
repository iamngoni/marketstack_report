import 'package:dartz/dartz.dart';

import '../../../../core/models/app_exception.dart';
import '../../data/stock.dart';

abstract class StocksRepository {
  Future<Either<AppException, List<Stock>>> getStocks();
}
