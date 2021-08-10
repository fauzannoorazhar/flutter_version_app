part of 'version_check_bloc.dart';

class VersionCheckState {
  final Version version;

  VersionCheckState({this.version});

  VersionCheckState copyWith({
    Version version
  }) {
    return VersionCheckState(
      version: version ?? this.version
    );
  }
}

class VersionFailureState extends VersionCheckState {
  final String message;

  VersionFailureState(this.message);
}

