import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'connectivity_status_event.dart';
part 'connectivity_status_state.dart';

class ConnectivityStatusBloc
    extends Bloc<ConnectivityStatusEvent, ConnectivityStatusState> {
  ConnectivityStatusBloc() : super(Connected()) {
    on<DeviceConnected>((
      DeviceConnected event,
      Emitter<ConnectivityStatusState> emit,
    ) {
      emit(Connected());
    });
    on<DeviceDisconnected>((
      DeviceDisconnected event,
      Emitter<ConnectivityStatusState> emit,
    ) {
      emit(Offline());
    });
  }
}
