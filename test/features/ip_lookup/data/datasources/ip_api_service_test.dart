import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:your_parking_space/features/ip_lookup/data/datasources/ip_api_service.dart';
import 'package:your_parking_space/features/ip_lookup/data/models/ip_location_dto.dart';

class _MockDio extends Mock implements Dio {}

void main() {
  late _MockDio dio;
  late IpApiService service;

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: '/fallback'));
  });

  setUp(() {
    dio = _MockDio();
    when(
      () => dio.options,
    ).thenReturn(BaseOptions(baseUrl: 'https://ipapi.co'));
    service = IpApiService(dio);
  });

  group('IpApiService', () {
    test('lookupMyIp parses DTO from /json/', () async {
      final response = Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(path: '/json/'),
        statusCode: 200,
        data: const {
          'ip': '188.214.9.20',
          'city': 'Tower Hamlets',
          'region': 'England',
          'country_name': 'United Kingdom',
          'latitude': 51.5064,
          'longitude': -0.02,
          'country': 'UK',
          'in_eu': true,
        },
      );

      when(
        () => dio.fetch<Map<String, dynamic>>(any()),
      ).thenAnswer((_) async => response);

      final dto = await service.lookupMyIp();

      expect(dto, isA<IpLocationDto>());
      expect(dto.ip, '169.150.218.37');
      verify(() => dio.fetch<Map<String, dynamic>>(any())).called(1);
    });

    test('lookupSpecificIp calls /{ip}/json/ and parses DTO', () async {
      final response = Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(path: '/8.8.8.8/json/'),
        statusCode: 200,
        data: const {
          'ip': '8.8.8.8',
          'city': 'Mountain View',
          'region': 'California',
          'country_name': 'United States',
          'latitude': 37.42301,
          'longitude': -122.083352,
          'country': 'US',
          'in_eu': false,
        },
      );

      when(
        () => dio.fetch<Map<String, dynamic>>(any()),
      ).thenAnswer((_) async => response);

      final dto = await service.lookupSpecificIp('8.8.8.8');

      expect(dto.ip, '8.8.8.8');
      expect(dto.city, 'Mountain View');
      verify(() => dio.fetch<Map<String, dynamic>>(any())).called(1);
    });

    test('throws DioException on transport/server error', () async {
      when(() => dio.fetch<Map<String, dynamic>>(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/json/'),
          type: DioExceptionType.badResponse,
        ),
      );

      await expectLater(
        service.lookupMyIp(),
        throwsA(isA<DioException>()),
      );
    });
  });
}
