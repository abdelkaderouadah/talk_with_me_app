class ChatModel {
  final String chatMsg;
  final int chatIndex;

  ChatModel({required this.chatMsg, required this.chatIndex});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        chatMsg: json["chatMsg"],
        chatIndex: json["chatIndex"],
      );
}
