import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_parking_space/features/ip_lookup/data/datasources/ip_api_service.dart';
import 'package:your_parking_space/features/ip_lookup/data/models/ip_location_dto.dart';
import 'package:your_parking_space/features/ip_lookup/data/repositories/ip_lookup_repo_impl.dart';
import 'package:your_parking_space/features/ip_lookup/domain/entities/ip_location.dart';

class _MockService extends Mock implements IpApiService {}

void main() {
  late _MockService service;
  late IpLookupRepoImpl repo;

  setUp(() {
    service = _MockService();
    repo = IpLookupRepoImpl(dio: Dio(), service: service);
  });

  test('returns entity using lookupMyIp', () async {
    const dto = IpLocationDto(
      ip: '169.150.218.37',
      city: 'Tower Hamlets',
      region: 'England',
      countryName: 'United Kingdom',
      latitude: 51.5064,
      longitude: -0.02,
      country: 'UK',
      inEu: true,
    );
    when(() => service.lookupMyIp()).thenAnswer((_) async => dto);

    final result = await repo.getIpLocation();

    expect(result, isA<IpLocation>());
    expect(result.ip, '169.150.218.37');
    verify(() => service.lookupMyIp()).called(1);
    verifyNever(() => service.lookupSpecificIp(any()));
  });

  test(
    'returns entity using lookupSpecificIp',
    () async {
      const dto = IpLocationDto(
        ip: '8.8.8.8',
        city: 'Mountain View',
        region: 'California',
        countryName: 'United States',
        latitude: 37.42301,
        longitude: -122.083352,
        country: 'US',
        inEu: false,
      );
      when(
        () => service.lookupSpecificIp('8.8.8.8'),
      ).thenAnswer((_) async => dto);

      final result = await repo.getIpLocation(ip: '8.8.8.8');

      expect(result.ip, '8.8.8.8');
      expect(result.city, 'Mountain View');
      verify(() => service.lookupSpecificIp('8.8.8.8')).called(1);
      verifyNever(() => service.lookupMyIp());
    },
  );

  test('rethrows DioException from service', () async {
    when(() => service.lookupSpecificIp('8.8.8')).thenThrow(
      DioException(requestOptions: RequestOptions(path: '/8.8.8/json/')),
    );

    await expectLater(
      repo.getIpLocation(ip: '8.8.8'),
      throwsA(isA<DioException>()),
    );
  });
}
