import 'package:json_annotation/json_annotation.dart';

import 'daily_data.dart';

part 'stock_details.g.dart';

@JsonSerializable()
class StockDetails {
  StockDetails({
    required this.name,
    required this.symbol,
    this.country,
    required this.hasIntraday,
    required this.hasEod,
    required this.eod,
  });

  factory StockDetails.fromJson(Map<String, dynamic> json) =>
      _$StockDetailsFromJson(json);

  final String name;
  final String symbol;
  final String? country;
  @JsonKey(name: "has_intraday")
  final bool hasIntraday;
  @JsonKey(name: "has_eod")
  final bool hasEod;
  final List<DailyData> eod;
}
