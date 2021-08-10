import 'package:flutter_version_app/models/version.dart';

abstract class VersionService {
  Stream<Version> getVersion();
}
