import 'package:json_annotation/json_annotation.dart';

part 'daily_data.g.dart';

@JsonSerializable()
class DailyData {
  DailyData({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    this.adjHigh,
    this.adjLow,
    this.adjClose,
    this.adjOpen,
    this.adjVolume,
    required this.splitFactor,
    required this.dividend,
    required this.symbol,
    required this.exchange,
    required this.date,
  });

  factory DailyData.fromJson(Map<String, dynamic> json) =>
      _$DailyDataFromJson(json);

  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;
  @JsonKey(name: "adj_high")
  final double? adjHigh;
  @JsonKey(name: "adj_low")
  final double? adjLow;
  @JsonKey(name: "adj_close")
  final double? adjClose;
  @JsonKey(name: "adj_open")
  final double? adjOpen;
  @JsonKey(name: "adj_volume")
  final double? adjVolume;
  @JsonKey(name: "split_factor")
  final double splitFactor;
  final double dividend;
  final String symbol;
  final String exchange;
  final DateTime date;

  Map<String, dynamic> toJson() => _$DailyDataToJson(this);
}
