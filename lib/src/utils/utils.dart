import 'package:fixnum/fixnum.dart';
import 'package:uuid/uuid.dart';

class Timestamp {
  static Int64 build() {
    return Int64(DateTime.now().millisecondsSinceEpoch);
  }
}

class UUID {
  static String build() {
    return new Uuid().v4().replaceAll('-', '');
  }
}