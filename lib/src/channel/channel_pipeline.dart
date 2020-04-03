import 'package:dnetty/src/channel/channel_handler.dart';

import 'channel_handler.dart';

class ChannelPipeline {

  List<ChannelHandler> handlerList = [];

  ChannelPipeline addLast(ChannelHandler channelHandler) {
    handlerList.add(channelHandler);
    return this;
  }
}