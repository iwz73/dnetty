import 'channel_handler_context.dart';

class ChannelInboundHandler {
  void channelRegistered(ChannelHandlerContext var1) {}

  void channelUnregistered(ChannelHandlerContext var1) {}

  void channelActive(ChannelHandlerContext var1) {}

  void channelInactive(ChannelHandlerContext var1) {}

  void channelRead(ChannelHandlerContext var1, Object var2) {}

  void channelReadComplete(ChannelHandlerContext var1) {}

  void userEventTriggered(ChannelHandlerContext var1, Object var2) {}

  void channelWritabilityChanged(ChannelHandlerContext var1) {}

  void exceptionCaught(ChannelHandlerContext var1, Error var2) {}
}