// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IpLocationDto _$IpLocationDtoFromJson(Map<String, dynamic> json) =>
    IpLocationDto(
      ip: json['ip'] as String,
      city: json['city'] as String?,
      region: json['region'] as String?,
      regionCode: json['region_code'] as String?,
      country: json['country'] as String,
      countryName: json['country_name'] as String,
      continentCode: json['continent_code'] as String?,
      inEu: json['in_eu'] as bool,
      postal: json['postal'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      utcOffset: json['utc_offset'] as String?,
      countryCallingCode: json['country_calling_code'] as String?,
      currency: json['currency'] as String?,
      languages: json['languages'] as String?,
      asn: json['asn'] as String?,
      org: json['org'] as String?,
    );

Map<String, dynamic> _$IpLocationDtoToJson(IpLocationDto instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'city': instance.city,
      'region': instance.region,
      'region_code': instance.regionCode,
      'country': instance.country,
      'country_name': instance.countryName,
      'continent_code': instance.continentCode,
      'in_eu': instance.inEu,
      'postal': instance.postal,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'utc_offset': instance.utcOffset,
      'country_calling_code': instance.countryCallingCode,
      'currency': instance.currency,
      'languages': instance.languages,
      'asn': instance.asn,
      'org': instance.org,
    };
