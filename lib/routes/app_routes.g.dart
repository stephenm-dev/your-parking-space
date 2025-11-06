// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$ipLookupRoute, $mapRoute];

RouteBase get $ipLookupRoute =>
    GoRouteData.$route(path: '/', factory: $IpLookupRoute._fromState);

mixin $IpLookupRoute on GoRouteData {
  static IpLookupRoute _fromState(GoRouterState state) => IpLookupRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mapRoute =>
    GoRouteData.$route(path: '/map', factory: $MapRoute._fromState);

mixin $MapRoute on GoRouteData {
  static MapRoute _fromState(GoRouterState state) => MapRoute();

  @override
  String get location => GoRouteData.$location('/map');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
