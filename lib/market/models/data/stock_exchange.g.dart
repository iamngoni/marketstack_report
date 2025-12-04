// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_exchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockExchange _$StockExchangeFromJson(Map<String, dynamic> json) =>
    StockExchange(
      name: json['name'] as String,
      acronym: json['acronym'] as String,
      mic: json['mic'] as String,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
      city: json['city'] as String,
      website: json['website'] as String,
    );

Map<String, dynamic> _$StockExchangeToJson(StockExchange instance) =>
    <String, dynamic>{
      'name': instance.name,
      'acronym': instance.acronym,
      'mic': instance.mic,
      'country': instance.country,
      'country_code': instance.countryCode,
      'city': instance.city,
      'website': instance.website,
    };
