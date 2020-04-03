import 'dart:io';

import 'package:dnetty/dnetty.dart';
import 'package:dnetty/src/bootstrap/bootstrap.dart';
import 'package:dnetty/src/channel/channel_future.dart';

import 'channel/channel.dart';
import 'channel/channel_package.dart';

/// SocketClient
class SocketClient {

  // socket实例
  static Socket _socket;

  EventBus bus;

  factory SocketClient() => _getInstance();

  static SocketClient get instance => _getInstance();

  static SocketClient _instance;

  static SocketClient _getInstance() {

    if (_instance == null) {

      _instance = new SocketClient._internal();

    }
    return _instance;
  }

  SocketClient._internal() {
    // 初始化
    bus = new EventBus();
  }

  Future<ChannelFuture> startClient(String host, int port, [String fromId, String token]) async {
    Bootstrap bootstrap = Bootstrap();
    bootstrap.channel(Channel())
        .remoteAddress(host, port)
        .handler(ChannelPipeline().addLast(LengthFieldPrepender(2)));
     ChannelFuture channelFuture = await bootstrap.connect();
     return channelFuture;
  }

  Msg _buildHandshake(String fromId, String token) {
    Msg msg = Msg();
    Head head = Head();
    head.msgId = UUID.build();
    head.msgType = MsgType.HANDSHAKE;
    head.fromId = fromId;
    head.timestamp = Timestamp.build();
    head.extend = "{'token':'" + token + "'}";
    msg.head = head;
    return msg;
  }

  void decodeHandle(data){
    Msg msg = Msg.fromBuffer(data.sublist(2));
    switch (msg.head.msgType){
      case MsgType.PERSONAL:
        bus.emit(MsgType.PERSONAL, msg);
        break;
    }
  }

  void errorHandler(error, StackTrace trace){
    _socket.close();
    print("捕获socket异常信息：error=$error，trace=${trace.toString()}");
  }

  void doneHandler(){
    _socket.destroy();
    print("socket关闭处理");
  }

  static sendMsg(Msg msg) {
    LengthFieldPrepender encode = LengthFieldPrepender(2);
    _socket.add(encode.encode(msg));
  }
}