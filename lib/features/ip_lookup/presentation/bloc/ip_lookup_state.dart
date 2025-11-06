part of 'ip_lookup_bloc.dart';

@immutable
sealed class IpLookupState {}

final class IpLookupInitial extends IpLookupState {}

final class IpLookupLoading extends IpLookupState {}

final class IpLookupSuccess extends IpLookupState {
  IpLookupSuccess({
    required this.ipLocation,
  });

  final IpLocation ipLocation;
}

final class IpLookupError extends IpLookupState {}
