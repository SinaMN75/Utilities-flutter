import 'package:utilities/utilities.dart';

abstract class UUtils {
  static String uuidV4() => Uuid().v4();

  static String uuidV1() => Uuid().v1();
}
