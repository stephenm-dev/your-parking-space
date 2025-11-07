import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_parking_space/features/ip_lookup/domain/entities/ip_location.dart';
import 'package:your_parking_space/features/ip_lookup/domain/repositiories/ip_lookup_repo.dart';
import 'package:your_parking_space/features/ip_lookup/domain/usercases/get_ip_location.dart';

class _MockRepo extends Mock implements IpLookupRepo {}

void main() {
  late _MockRepo repo;
  late GetIpLocation usecase;

  setUp(() {
    repo = _MockRepo();
    usecase = GetIpLocation(repo);
  });

  test('calls repo.getIpLocation() when ip omitted (self)', () async {
    const expected = IpLocation(
      ip: '188.214.9.20',
      city: 'Tower Hamlets',
      region: 'England',
      countryName: 'United Kingdom',
      latitude: 51.5064,
      longitude: -0.02,
      country: 'UK',
      postal: 'E14',
    );
    when(
      () => repo.getIpLocation(ip: any(named: 'ip')),
    ).thenAnswer((_) async => expected);

    final res = await usecase();

    expect(res, expected);
    verify(() => repo.getIpLocation()).called(1);
  });

  test('calls repo.getIpLocation(ip) when ip provided', () async {
    const expected = IpLocation(
      ip: '8.8.8.8',
      city: 'Mountain View',
      region: 'California',
      countryName: 'United States',
      latitude: 37.42301,
      longitude: -122.083352,
      country: 'US',
      postal: '94043',
    );
    when(
      () => repo.getIpLocation(ip: '8.8.8.8'),
    ).thenAnswer((_) async => expected);

    final res = await usecase(ip: '8.8.8.8');

    expect(res, expected);
    verify(() => repo.getIpLocation(ip: '8.8.8.8')).called(1);
  });
}
