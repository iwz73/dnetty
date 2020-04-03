import 'dart:io';

import 'package:dnetty/dnetty.dart';
import 'package:dnetty/src/channel/channel_handler.dart';

import 'channel_pipeline.dart';

class Channel {


  final String _id = UUID.build();

  Socket socket;

  ChannelPipeline channelPipeline;

  String id() {
    return _id;
  }

  bool isActive() {
    return socket != null ? true : false;
  }

  write(Object obj) {
    List<ChannelHandler> handlerList = channelPipeline.handlerList;
    handlerList.forEach((element) {
      Object encodeResult = element;
      if(encodeResult is List<int>) {
        socket.add(encodeResult);
      }
    });
  }


}