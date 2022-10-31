import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/configs/api_configs.dart';
import '../../../../core/functions/dio_error_to_app_exception.dart';
import '../../../../core/models/app_exception.dart';
import '../../data/stock.dart';
import '../../data/stock_details.dart';
import '../base/stocks_repository.dart';

class StocksRepositoryImpl implements StocksRepository {
  @override
  Future<Either<AppException, List<Stock>>> getStocks() async {
    try {
      final Response<Map<String, dynamic>> response = await dio.get(
        "${ApiConfigs.baseUrl}/tickers?access_key=${ApiConfigs.apiKey}",
      );
      final Map<String, dynamic> data = response.data!;
      final List<Stock> stocks = (data["data"] as List)
          .map<Stock>((json) => Stock.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(stocks);
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace);
      if (e is DioError) {
        return Left(dioErrorToAppException(e));
      }

      return Left(AppException(e.toString()));
    }
  }

  @override
  Future<Either<AppException, StockDetails>> getStockDetails(
    Stock stock,
  ) async {
    try {
      final Response<Map<String, dynamic>> response = await dio.get(
        "${ApiConfigs.baseUrl}/tickers/${stock.symbol.toLowerCase()}/eod?access_key=${ApiConfigs.apiKey}",
      );
      final Map<String, dynamic> data = response.data!;
      final StockDetails stockDetails =
          StockDetails.fromJson(data["data"] as Map<String, dynamic>);
      return Right(stockDetails);
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace);

      if (e is DioError) {
        return Left(dioErrorToAppException(e));
      }

      return Left(AppException(e.toString()));
    }
  }

  final Dio dio = Dio()
    ..interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
}
