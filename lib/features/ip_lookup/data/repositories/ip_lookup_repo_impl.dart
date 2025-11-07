import 'package:dio/dio.dart';
import 'package:your_parking_space/features/ip_lookup/data/datasources/ip_api_service.dart';
import 'package:your_parking_space/features/ip_lookup/domain/entities/ip_location.dart';
import 'package:your_parking_space/features/ip_lookup/domain/repositiories/ip_lookup_repo.dart';

class IpLookupRepoImpl implements IpLookupRepo {
  IpLookupRepoImpl({
    required this.dio,
    IpApiService? service,
  }) : _ipApiService = service ?? IpApiService(dio);

  final Dio dio;
  final IpApiService _ipApiService;

  @override
  Future<IpLocation> getIpLocation({String? ip}) async {
    try {
      final res = ip == null || ip.trim().isEmpty
          ? await _ipApiService.lookupMyIp()
          : await _ipApiService.lookupSpecificIp(ip.trim());
      return res.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
