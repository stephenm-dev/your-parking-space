import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:your_parking_space/features/ip_lookup/data/models/ip_location_dto.dart';

part 'ip_api_service.g.dart';

@RestApi(baseUrl: 'https://ipapi.co/')
abstract class IpApiService {
  factory IpApiService(Dio dio, {String baseUrl}) = _IpApiService;

  @GET('/json/')
  Future<IpLocationDto> lookupMyIp();

  @GET('/{ip}/json/')
  Future<IpLocationDto> lookupSpecificIp(
    @Path('ip') String ip,
  );
}
