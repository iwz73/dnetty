/// MsgType
/// HANDSHAKE: 握手
/// HEARTBEAT: 心跳
/// PERSONAL: 私聊
/// GROUP: 群聊
class MsgType {
  static const HANDSHAKE = 1010;
  static const HEADSHAKE = 1011;
  static const HEARTBEAT = 1020;
  static const PERSONAL = 2001;
  static const GROUP = 3001;
}

/// MsgContentType
/// TEXT: 文字
/// IMAGE: 图像
/// VOICE: 声音
/// VIDEO: 视频
class MsgContentType {
  static const TEXT = 101;
  static const IMAGE = 102;
  static const VOICE = 103;
  static const VIDEO = 104;
}


