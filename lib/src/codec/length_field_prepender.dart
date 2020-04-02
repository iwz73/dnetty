import 'dart:typed_data';

import 'package:dnetty/dnetty.dart';

class LengthFieldPrepender {

  final int lengthFieldLength;

  LengthFieldPrepender(this.lengthFieldLength) {
    if (lengthFieldLength != 1 && lengthFieldLength != 2  && lengthFieldLength != 4 && lengthFieldLength != 8) {
      throw ArgumentError("lengthFieldLength must be either 1, 2, 4, or 8: $lengthFieldLength");
    }
  }


  List<int> encode(Msg msg) {
    Uint8List msgBuffer = msg.writeToBuffer();
    int length = msgBuffer.length;
    switch(this.lengthFieldLength) {
      case 1:
        if (length >= 256) {
          throw ArgumentError("length does not fit into a byte: $length");
        }
        var header = ByteData(1);
        header.setInt8(0, length);
        return header.buffer.asUint8List() + msgBuffer;
      case 2:
        if (length >= 65536) {
          throw ArgumentError("length does not fit into a short integer: $length");
        }
        var header = ByteData(2);
        header.setInt16(0, length);
        return header.buffer.asUint8List() + msgBuffer;
        break;
      case 4:
        var header = ByteData(4);
        header.setInt32(0, length);
        return header.buffer.asUint8List() + msgBuffer;
        break;
      case 8:
        var header = ByteData(8);
        header.setInt64(0, length);
        return header.buffer.asUint8List() + msgBuffer;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
      default:
        throw FormatException("should not reach here");
    }
  }

}