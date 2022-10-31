import 'package:json_annotation/json_annotation.dart';

part 'stock_exchange.g.dart';

@JsonSerializable()
class StockExchange {
  StockExchange({
    required this.name,
    required this.acronym,
    required this.mic,
    required this.country,
    required this.countryCode,
    required this.city,
    required this.website,
  });

  factory StockExchange.fromJson(Map<String, dynamic> json) =>
      _$StockExchangeFromJson(json);

  final String name;
  final String acronym;
  final String mic;
  final String country;
  @JsonKey(name: "country_code")
  final String countryCode;
  final String city;
  final String website;
}
