import 'dart:io';

import 'package:dnetty/src/channel/channel_package.dart';

class Bootstrap {

  var _host;
  int _port;
  Channel _channel;

  Bootstrap channel(Channel channel) {
    _channel = channel;
    return this;
  }

  Bootstrap remoteAddress(host, int port) {
    _host = host;
    _port = port;
    return this;
  }

  Bootstrap handler(ChannelPipeline channelPipeline) {
    if(_channel != null) {
      _channel.channelPipeline = channelPipeline;
    }
    return this;
  }

  Future<ChannelFuture> connect() async{
    if(_host != null && _port != null) {
      await Socket.connect(_host, _port).then((socket) {
        _channel.socket = socket;
        socket.listen((onData) {

        });
      });
    }
    return ChannelFuture(channel: _channel);
  }


}