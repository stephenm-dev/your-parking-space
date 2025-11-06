import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_parking_space/features/ip_lookup/domain/entities/ip_location.dart';
import 'package:your_parking_space/features/ip_lookup/presentation/ip_lookup_page.dart';
import 'package:your_parking_space/features/map/map_page.dart';

part 'app_routes.g.dart';

@TypedGoRoute<IpLookupRoute>(path: '/')
class IpLookupRoute extends GoRouteData with $IpLookupRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const IpLookupPage();
  }
}

@TypedGoRoute<MapRoute>(path: '/map')
class MapRoute extends GoRouteData with $MapRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    final ipLocation = state.extra! as IpLocation;

    return MapPage(
      ipLocation: ipLocation,
    );
  }
}
