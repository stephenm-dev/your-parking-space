import 'package:your_parking_space/features/ip_lookup/domain/entities/ip_location.dart';
import 'package:your_parking_space/features/ip_lookup/domain/repositiories/ip_lookup_repo.dart';

class GetIpLocation {
  GetIpLocation(this.repo);
  final IpLookupRepo repo;

  Future<IpLocation> call({String? ip}) {
    return repo.getIpLocation(ip: ip);
  }
}
