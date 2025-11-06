part of 'ip_lookup_bloc.dart';

@immutable
sealed class IpLookupEvent {}

final class FetchIpLocation extends IpLookupEvent {
  FetchIpLocation({this.ip});

  final String? ip;
}
