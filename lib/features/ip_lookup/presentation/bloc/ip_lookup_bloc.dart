import 'package:dio/dio.dart';
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
    } on DioException catch (e) {
      String message;
      switch (e.response?.statusCode) {
        case 200:
          message = e.message ?? 'Unknown error';
        case 400:
          message = 'Bad Request – Please check the IP address.';
        case 403:
          message = 'Authentication Failed – Invalid or missing API key.';
        case 404:
          message = 'URL Not Found – The endpoint may be incorrect.';
        case 405:
          message = 'Method Not Allowed – Check the HTTP method used.';
        case 429:
          message = 'Quota Exceeded – You are being rate limited.';
        default:
          message = '';
      }
      emit(
        IpLookupError(
          message: message,
        ),
      );
    } catch (e) {
      emit(
        IpLookupError(
          message: 'Unknown error',
        ),
      );
    }
  }

  final GetIpLocation getIpLocation;
}
