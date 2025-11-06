import 'package:your_parking_space/features/ip_lookup/domain/entities/ip_location.dart';

abstract class IpLookupRepo {
  Future<IpLocation> getIpLocation({String? ip});
}
