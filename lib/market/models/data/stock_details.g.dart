// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockDetails _$StockDetailsFromJson(Map<String, dynamic> json) => StockDetails(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      country: json['country'] as String?,
      hasIntraday: json['has_intraday'] as bool,
      hasEod: json['has_eod'] as bool,
      eod: (json['eod'] as List<dynamic>)
          .map((e) => DailyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockDetailsToJson(StockDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'country': instance.country,
      'has_intraday': instance.hasIntraday,
      'has_eod': instance.hasEod,
      'eod': instance.eod,
    };
