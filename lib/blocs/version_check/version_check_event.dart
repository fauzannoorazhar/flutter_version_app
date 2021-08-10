part of 'version_check_bloc.dart';

abstract class VersionCheckEvent extends Equatable {
  const VersionCheckEvent();
}

class UpdateVersionEvent extends VersionCheckEvent {
  final Version version;

  UpdateVersionEvent({
    @required this.version,
  });

  @override
  List<Object> get props => [version];
}

class InitialLoadVersionEvent extends VersionCheckEvent {
  @override
  String toString() {
    return 'InitialLoadVersionEvent';
  }

  @override
  List<Object> get props => null;
}