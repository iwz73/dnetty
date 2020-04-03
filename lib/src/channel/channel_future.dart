import 'dart:async';

import 'package:dnetty/src/channel/channel.dart';

class ChannelFuture{

  final Channel _channel;

  ChannelFuture({Channel channel}) : this._channel = channel;

  Channel channel() {
    return _channel;
  }
}