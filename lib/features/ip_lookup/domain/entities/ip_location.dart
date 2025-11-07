class IpLocation {
  const IpLocation({
    required this.ip,
    required this.city,
    required this.region,
    required this.country,
    required this.countryName,
    required this.postal,
    required this.latitude,
    required this.longitude,
  });

  final String ip;
  final String city;
  final String region;
  final String country;
  final String countryName;
  final String postal;
  final double latitude;
  final double longitude;
}
