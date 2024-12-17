import 'package:utilities/utilities.dart';

abstract class UUtils {
  static String uuidV4() => const Uuid().v4();

  static String uuidV1() => const Uuid().v1();
}
