import 'package:pocketbase/pocketbase.dart';

class PbHelper {
  static final pb = PocketBase(
      const String.fromEnvironment('PB_BASEURL').isEmpty
          ? 'http://localhost:8090'
          : const String.fromEnvironment('PB_BASEURL'));
}
