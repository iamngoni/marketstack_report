import 'package:json_annotation/json_annotation.dart';

import 'stock_exchange.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  Stock({
    required this.name,
    required this.symbol,
    required this.hasIntraDay,
    required this.hasEod,
    this.country,
    required this.stockExchange,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  final String name;
  final String symbol;
  @JsonKey(name: "has_intraday")
  final bool hasIntraDay;
  @JsonKey(name: "has_eod")
  final bool hasEod;
  final String? country;
  @JsonKey(name: "stock_exchange")
  final StockExchange stockExchange;
}
