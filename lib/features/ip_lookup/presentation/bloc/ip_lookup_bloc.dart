import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_parking_space/features/ip_lookup/domain/entities/ip_location.dart';
import 'package:your_parking_space/features/ip_lookup/domain/usercases/get_ip_location.dart';

part 'ip_lookup_event.dart';
part 'ip_lookup_state.dart';

class IpLookupBloc extends Bloc<IpLookupEvent, IpLookupState> {
  IpLookupBloc(
    this.getIpLocation,
  ) : super(IpLookupInitial()) {
    on<IpLookupEvent>((event, emit) async {
      switch (event) {
        case FetchIpLocation():
          await fetchIpLocation(event, emit);
      }
    });
  }

  Future<void> fetchIpLocation(
    FetchIpLocation event,
    Emitter<IpLookupState> emit,
  ) async {
    emit(IpLookupLoading());
    try {
      final res = await getIpLocation(ip: event.ip);
      emit(
        IpLookupSuccess(ipLocation: res),
      );
    } catch (e) {
      emit(IpLookupError());
    }
  }

  final GetIpLocation getIpLocation;
}
