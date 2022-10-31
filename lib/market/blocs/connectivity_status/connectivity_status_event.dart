part of 'connectivity_status_bloc.dart';

@immutable
abstract class ConnectivityStatusEvent {}

class DeviceConnected extends ConnectivityStatusEvent {}

class DeviceDisconnected extends ConnectivityStatusEvent {}
