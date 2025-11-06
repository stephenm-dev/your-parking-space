import 'package:json_annotation/json_annotation.dart';
import 'package:your_parking_space/features/ip_lookup/domain/entities/ip_location.dart';

part 'ip_location_dto.g.dart';

@JsonSerializable()
class IpLocationDto {
  const IpLocationDto({
    required this.ip,
    this.city,
    this.region,
    this.regionCode,
    required this.country,
    required this.countryName,
    this.continentCode,
    required this.inEu,
    this.postal,
    this.latitude,
    this.longitude,
    this.timezone,
    this.utcOffset,
    this.countryCallingCode,
    this.currency,
    this.languages,
    this.asn,
    this.org,
  });

  factory IpLocationDto.fromJson(Map<String, dynamic> json) =>
      _$IpLocationDtoFromJson(json);

  final String ip;
  final String? city;
  final String? region;

  @JsonKey(name: 'region_code')
  final String? regionCode;

  final String country;

  @JsonKey(name: 'country_name')
  final String countryName;

  @JsonKey(name: 'continent_code')
  final String? continentCode;

  @JsonKey(name: 'in_eu')
  final bool inEu;

  final String? postal;
  final double? latitude;
  final double? longitude;
  final String? timezone;

  @JsonKey(name: 'utc_offset')
  final String? utcOffset;

  @JsonKey(name: 'country_calling_code')
  final String? countryCallingCode;

  final String? currency;
  final String? languages;
  final String? asn;
  final String? org;

  Map<String, dynamic> toJson() => _$IpLocationDtoToJson(this);

  IpLocation toEntity() => IpLocation(
    ip: ip,
    city: city ?? '-',
    region: region ?? '-',
    regionCode: regionCode ?? '-',
    country: country,
    countryName: countryName,
    postal: postal ?? '-',
    latitude: latitude,
    longitude: longitude,
  );
}
